#!/usr/bin/env zsh
#
# stow.sh - GNU Stow replacement for Windows
# Creates Windows-native symlinks mirroring the stow directory structure.
#
# Usage: ./stow.sh [-D|--delete] [-R|--restow] <package> [package2 ...]
# Example: ./stow.sh nvim kitty hypr
#          ./stow.sh -R windows-terminal   (unstow + stow)
#          ./stow.sh -D windows-terminal   (unstow only)
#
# Each package directory is walked recursively. Files inside are symlinked
# into $HOME following the same relative path (just like GNU Stow).
#
# Limitations:
#   - Windows only: requires MSYS2/Git Bash (uses cygpath, powershell.exe)
#   - Requires Developer Mode enabled or an elevated (admin) shell
#   - Does not handle directory symlinks, only files
#   - Will not overwrite existing files/symlinks that point elsewhere

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
RESTOW=false
DELETE=false

while [[ "${1:-}" == -* ]]; do
  case "$1" in
    -R|--restow) RESTOW=true; shift ;;
    -D|--delete) DELETE=true; shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
done

if [[ $# -eq 0 ]]; then
  echo "Usage: stow.sh [-D|--delete] [-R|--restow] <package> [package2 ...]"
  echo "  -D, --delete  Remove symlinks only (unstow)"
  echo "  -R, --restow  Remove existing symlinks then re-create them"
  echo "Available packages:"
  for dir in "$DOTFILES_DIR"/*/; do
    pkg="$(basename "$dir")"
    [[ "$pkg" == ".git" || "$pkg" == ".kiro" ]] && continue
    echo "  $pkg"
  done
  exit 1
fi

# Convert a MSYS2/Git Bash path to a Windows path
to_winpath() {
  cygpath -w "$1" 2>/dev/null || echo "$1"
}

unlink_package() {
  local pkg="$1"
  local pkg_dir="$DOTFILES_DIR/$pkg"

  echo "Unstowing $pkg..."

  find "$pkg_dir" -type f -printf '%P\n' | while read -r rel; do
    local target="$HOME/$rel"
    local src="$pkg_dir/$rel"

    if [[ -L "$target" ]]; then
      local current_target
      current_target="$(readlink "$target" 2>/dev/null || true)"
      if [[ "$current_target" == "$src" ]]; then
        rm "$target"
        echo "  removed: ~/$rel"
      else
        echo "  skip (not ours): ~/$rel -> $current_target"
      fi
    fi
  done
}

link_package() {
  local pkg="$1"
  local pkg_dir="$DOTFILES_DIR/$pkg"

  if [[ ! -d "$pkg_dir" ]]; then
    echo "Error: package '$pkg' not found in $DOTFILES_DIR"
    return 1
  fi

  echo "Stowing $pkg..."

  # Find all files (not directories) inside the package
  # Use -printf to get clean relative paths directly from find
  find "$pkg_dir" -type f -printf '%P\n' | while read -r rel; do
    local src="$pkg_dir/$rel"
    local target="$HOME/$rel"
    local target_dir="$(dirname "$target")"

    # Create parent directories if needed
    if [[ ! -d "$target_dir" ]]; then
      mkdir -p "$target_dir"
    fi

    # If target already exists
    if [[ -e "$target" || -L "$target" ]]; then
      # If it's already a symlink pointing to the right place, skip
      if [[ -L "$target" ]]; then
        local current_target
        current_target="$(readlink "$target" 2>/dev/null || true)"
        if [[ "$current_target" == "$src" ]]; then
          echo "  skip (already linked): $rel"
          continue
        fi
      fi
      echo "  conflict: ~/$rel already exists, skipping (remove it first to re-link)"
      continue
    fi

    # Create Windows symlink via PowerShell
    local win_src win_target
    win_src="$(to_winpath "$src")"
    win_target="$(to_winpath "$target")"

    if powershell.exe -NoProfile -Command "New-Item -ItemType SymbolicLink -Path '$win_target' -Target '$win_src' | Out-Null" 2>/dev/null; then
      echo "  linked: ~/$rel -> $src"
    else
      echo "  FAILED: ~/$rel (do you have Developer Mode enabled or an elevated shell?)"
    fi
  done
}

for pkg in "$@"; do
  if $DELETE; then
    unlink_package "$pkg"
  elif $RESTOW; then
    unlink_package "$pkg"
    link_package "$pkg"
  else
    link_package "$pkg"
  fi
done

echo "Done."
