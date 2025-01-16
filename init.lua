require("config.lazy")

require("catppuccin").setup({
 flavour = "macchiato",
  integrations = {
   treesitter = true,
   nvimtree = true
 }
})
vim.cmd.colorscheme "catppuccin"

require("nvim-tree").setup({
  git = {
    ignore = false, -- Disable hiding files in .gitignore
  },
  filters = {
    dotfiles = false, -- Show hidden files (optional, if needed)
  },
})
require("config.nvim-tree")

require("telescope").load_extension("fzy_native")
require("config.telescope")

require("gitsigns").setup()

require("harpoon")
require("config.harpoon")

require("config.tags")

require("neotest").setup({
  adapters = {
    require("neotest-rspec")
  },
})
require("config.neotest")

require("mason")
require("config.mason")
