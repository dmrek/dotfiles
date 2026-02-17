vim.cmd.syntax("on")

vim.schedule(function()
    vim.opt.clipboard = { "unnamed", "unnamedplus" }
end)

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.history = 5000

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.scrolloff = 8
vim.opt.showmode = false

vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.expandtab = true

vim.opt.confirm = true
