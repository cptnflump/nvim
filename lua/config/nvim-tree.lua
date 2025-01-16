-- Open nvim-tree on startup
local function open_nvim_tree()
  require("nvim-tree.api").tree.open()
end

vim.keymap.set('n', '<leader>ft', ':NvimTreeFindFile<CR>:NvimTreeFocus<CR>', { noremap = true, silent = true })
