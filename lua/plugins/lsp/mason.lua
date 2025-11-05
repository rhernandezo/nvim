return {
  "williamboman/mason-lspconfig.nvim",
  opts = {
    -- List of servers to automatically install if not already present
    ensure_installed = {
      "ts_ls",
      "cssls",
      "html",
      "tailwindcss",
      "emmet_ls",
      "jsonls",
      "lua_ls",
      "eslint",
      "intelephense",
      "phpactor",
    },
  },
  dependencies = {
    {
      "williamboman/mason.nvim",
      opts = {
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      },
    },
    "neovim/nvim-lspconfig",
  }
}
