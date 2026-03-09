return {
  "iamcco/markdown-preview.nvim",
  build = "cd app && npm install",
  ft = "markdown",
  config = function()
    if vim.fn.has("wsl") == 1 then
      vim.g.mkdp_browserfunc = "OpenBrowser"
      vim.cmd([[
        function! OpenBrowser(url)
          silent! execute '!/mnt/c/Windows/System32/cmd.exe /c start "" ' . a:url
        endfunction
      ]])
    end
  end,
}
