return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,

  opts = {
    color_overrides = {
      mocha = {
        base = "#000000",
        mantle = "#000000",
        crust = "#000000",
      },
    },
  },

  config = function(_, opts)
    local theme = require('catppuccin')

    theme.setup(opts)
    theme.load()
  end
}
