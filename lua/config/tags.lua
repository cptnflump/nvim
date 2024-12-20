-- Use the 'tags' file for navigation
vim.opt.tags = "./tags,tags;" -- Search for a 'tags' file in the current and parent directories

-- Jump to tag definition
vim.keymap.set('n', '<C-]>', '<Cmd>normal! <C-]><CR>', { noremap = true, silent = true })
-- Jump back to previous position
vim.keymap.set('n', '<C-t>', '<Cmd>normal! <C-t><CR>', { noremap = true, silent = true })
