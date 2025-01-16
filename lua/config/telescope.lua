local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope Buffers' })
vim.keymap.set('n', '<leader>fr', function()
    require('telescope.builtin').lsp_references({
        include_current_line = true,
    })
end, { desc = "Find references (include current)" })
