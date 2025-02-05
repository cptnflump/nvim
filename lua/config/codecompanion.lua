vim.keymap.set({ "n", "v" }, "<leader>cc", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })

vim.g['display_diff_provider'] = 'minidiff'
