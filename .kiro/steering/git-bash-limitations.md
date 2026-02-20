---
inclusion: auto
---

# Git Bash Limitations on Windows

## Terminal Stack
- Terminal emulator: Windows Terminal (GPU-accelerated)
- Shell: zsh (via Git Bash / MSYS2 runtime)
- Plugin manager: zinit

## MSYS2 Rendering Constraints
- Git Bash uses the MSYS2 compatibility layer to emulate a POSIX environment
- MSYS2's pty translation layer causes flickering with plugins that do rapid terminal redraws
- Prompt: Powerlevel10k (with instant prompt to avoid flicker)
- Plugins kept minimal to avoid rendering issues:
  - zsh-completions
  - OMZ snippets: git, ssh-agent
- Avoid: zsh-syntax-highlighting, zsh-autosuggestions, fzf, fzf-tab, zoxide, oh-my-posh — they all flicker due to MSYS2 pty layer

## Dotfiles
- Repo: c:\Users\d_krek\dotfiles
- Uses GNU Stow directory convention: each top-level folder is a "package"
- Deployed via stow-for-win.sh (Windows symlinks)
