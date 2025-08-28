return {
  {
    "nvim-treesitter/nvim-treesitter",
    -- enabled = false,
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = { 
          "c",
          "lua",
          "vim",
          "vimdoc",
          "query",
          "elixir",
          "heex",
          "javascript",
          "html",
          "css",
          "scss",
          "vue",
          "php",
          "typescript",
          "blade"
        },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = false },

        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<Enter>", -- set to false to disabled one of the mapping
            node_incremental = "<Enter>",
            scope_incremental = false,
            node_decremental = "<Backspace>",
          },
        },
      })
    end
  }
}
