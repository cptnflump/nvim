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

require("gitsigns").setup({
  current_line_blame = true
})

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
  prompt_library = {
    ["Engineer"] = {
      strategy = "chat",
      description = "chat with the LLM as an Engineer",
      prompts = {
        {
          role = "system",
          content = [[
          You are an experienced Ruby on Rails tech lead, with knowledge of Ruby, Rails and all commonly used gems

          ]]
        }
      }
    }
  },
  adapters = {
    ollama_deepseek = function()
      return require("codecompanion.adapters").extend("ollama", 
      {
        name = "ollama_deepseek", -- Give this adapter a different name to differentiate it from the default ollama adapter
        schema = {
          model = {
            default = "deepcoder",
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
    action_palette = {
      width = 95,
      height = 10,
      prompt = "Prompt ", -- Prompt used for interactive LLM calls
      provider = "telescope", -- default|telescope|mini_pick
      opts = {
        show_default_actions = true, -- Show the default actions in the action palette?
        show_default_prompt_library = true, -- Show the default prompt library in the action palette?
      },
    },
  }
})

require("config.codecompanion")

require("mini.diff").setup()

require("config.copilot")
