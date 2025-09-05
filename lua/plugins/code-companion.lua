-- Code Companion es un plugin de Neovim que integra modelos de lenguaje avanzados para asistir
-- en la escritura y revisión de código, proporcionando sugerencias contextuales y mejoras
-- basadas en inteligencia artificial.

return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {},

    config = function()
      require("codecompanion").setup({
        strategies = {
          chat = {
            name = "copilot",
            model = "gpt-4.1",
          },
          inline = {
            adapter = "anthropic",
          },
          review = {
            adapter = "anthropic",
          }
        },
      })
    end

  },
}
