return {
  "goolord/alpha-nvim",
  lazy = false,
  dependencies = {
    "ozthemagician/alpha-cowsays-nvim",
  },
  config = function()
    local alpha = require("alpha")
    local startify = require("alpha.themes.startify")
    local cow = require("alpha-cowsays-nvim")

    startify.section.header.val = cow.cowsays()

    alpha.setup(startify.config)
  end,
}
