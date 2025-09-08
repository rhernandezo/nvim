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
      -- position = "bottom", -- o "top"
      -- margin = { 1, 0, 1, 0 },
      -- padding = { 2, 2, 2, 2 },

    },
  },
}

