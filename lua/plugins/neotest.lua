return {
  -- Neotest core plugin
  {
    "nvim-neotest/neotest",
    dependencies = {
      "olimorris/neotest-rspec", -- RSpec adapter
      "nvim-lua/plenary.nvim",  -- Required dependency
      "nvim-treesitter/nvim-treesitter", -- Optional, improves test parsing
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/nvim-nio"
    },
  },
}
