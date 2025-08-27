return {
  -- the colorscheme should be available when starting Neovim
  {
    "rebelot/kanagawa.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      
      require('kanagawa').setup({
        transparent = true,
        statementStyle = { bold = true },
        -- theme = "dragon",

        overrides = function(colors) -- add/modify highlights
          return {
            -- Label = { bold = false },
          }
        end,
      })

      -- load the colorscheme here
      -- vim.cmd([[colorscheme kanagawa-wave]])
      vim.cmd.colorscheme "kanagawa-dragon"

      
      -- vim.cmd('highlight htmlTag gui=NONE cterm=NONE')
      -- vim.cmd('highlight htmlTagName gui=NONE cterm=NONE') 


    end,
  },
}
