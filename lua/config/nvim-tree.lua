-- Open nvim-tree on startup
local function open_nvim_tree()
  require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

vim.keymap.set('n', '<leader>ft', ':NvimTreeFocus<CR>', { noremap = true, silent = true })
