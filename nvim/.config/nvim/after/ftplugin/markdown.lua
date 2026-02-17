-- Disable the built-in "show table of contents" mapping
pcall(vim.keymap.del, 'n', 'gO', { buffer = 0 })
