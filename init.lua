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

require("config.lazydocker")

require("codecompanion").setup({
  adapters = {
    ollama_deepseek = function()
      return require("codecompanion.adapters").extend("ollama", {
        name = "ollama_deepseek", -- Give this adapter a different name to differentiate it from the default ollama adapter
        schema = {
          model = {
            default = "deepseek-coder-v2",
          },
        },
      })
    end,
  },
  strategies = {
    chat = {
      adapter = "ollama_deepseek",
    },
    inline = {
      adapter = "ollama_deepseek",
    }
  },
  display = {
    diff = {
      provider = "mini_diff",
    },
  }
})

require("config.codecompanion")

require("mini.diff").setup()
