return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    plugins = {
      spelling = {
        enabled = true,
        suggestions = 20,
      },
    },
    win = {
      border = "single", -- single, double, shadow
    },
    layout = {
      height = { min = 4, max = 25 }, -- min and max height of the columns
      width = { min = 3, max = 50 }, -- min and max width of the columns
      spacing = 3, -- spacing between columns
      align = "left", -- align columns left, center or right
    },
    show_help = true,
  },
}

