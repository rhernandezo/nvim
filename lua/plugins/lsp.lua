---@diagnostic disable: undefined-global
-- ~/.config/nvim/lua/plugins/lsp.lua

return {
  -- El plugin principal para las configuraciones del LSP
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- Mason: para instalar los LSPs de forma automática y sencilla
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",

      -- Plugins para autocompletado (nvim-cmp)
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp", -- Fuente de autocompletado para el LSP
      "L3MON4D3/LuaSnip", -- Motor de snippets (muy útil)
    },
    config = function()
      -- Esta es la función que se ejecuta cuando se carga el plugin

      local lspconfig = require("lspconfig")
      local cmp = require("cmp")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()


      -- 1. Definir la forma en que se ven los íconos de error
      local signs = { Error = "󰅙 ", Warn = " ", Hint = "󰌶 ", Info = " " }
      for type, icon in pairs(signs) do
          local hl = "DiagnosticSign" .. type
          vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

      -- 2. Configuración general de los diagnósticos
      vim.diagnostic.config({
          -- Mostrar el error en la columna de signos (¡Lo que pediste!)
          signs = true,

          -- No mostrar el texto del error al final de la línea (para no ensuciar la vista)
          virtual_text = true,

          -- Configuración para la ventana flotante (popup) con el error completo
          float = {
              source = "always", -- Muestra la fuente (e.g., intelephense)
              header = "",       -- Sin encabezado extra
              border = "rounded", -- Bordes más bonitos
          },

          -- No actualiza mientras estás en modo inserción, solo al salir
          update_in_insert = false,

          -- Mostrar los más graves primero (errores > warnings)
          severity_sort = true,
      })


      -- CONFIGURACIÓN DE MASON
      -- Mason se encarga de que los LSPs que necesitamos estén instalados
      require("mason").setup()
      require("mason-lspconfig").setup({
        -- Aquí le dices a Mason cuáles LSPs debe asegurarse de tener instalados.
        -- ¡No tienes que instalarlos a mano!
        ensure_installed = {
          "intelephense", -- Para PHP
          "laravel_ls",   -- Para Laravel (Blade, rutas, etc.)
          "volar",        -- Para Vue 3
        },
      })

      -- CONFIGURACIÓN DE LOS LSP SERVERS
      -- Aquí le decimos a nvim-lspconfig cómo debe iniciar cada servidor.
      -- mason-lspconfig hace que esto sea súper fácil.
      require("mason-lspconfig").setup_handlers({
        function(server_name) -- La configuración por defecto para cada servidor
          lspconfig[server_name].setup({
            capabilities = capabilities,
          })
        end,
        -- Puedes poner configuraciones específicas para un servidor si lo necesitas.
        -- Por ejemplo, para Intelephense, si tienes una licencia:
        ["intelephense"] = function()
          lspconfig.intelephense.setup({
            capabilities = capabilities,
            -- settings = {
            --   intelephense = {
            --     licenceKey = "AQUI_VA_TU_LICENCIA",
            --   },
            -- },
          })
        end,
      })

      -- CONFIGURACIÓN DEL AUTOCOMPLETADO (nvim-cmp)
      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        sources = {
          { name = "nvim_lsp" }, -- Sugerencias del Language Server
          { name = "luasnip" },  -- Sugerencias de snippets
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Aceptar la sugerencia con Enter
        }),
      })

      -- ATAJOS DE TECLADO ÚTILES PARA EL LSP
      -- Estos atajos se activarán solo en los archivos donde el LSP esté funcionando.
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          -- Activa la ayuda de la signatura al escribir (por ejemplo, los parámetros de una función)
          -- require "lsp_signature".on_attach() -- Descomentar si instalas el plugin de signaturas

          local opts = { buffer = ev.buf, noremap = true, silent = true }
          -- Atajos de teclado. 'K' para ver documentación, 'gd' para ir a la definición, etc.
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
          vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
          vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
          vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, opts)
          vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
          vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
          vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
          vim.keymap.set('n', '<space>f', function()
            vim.lsp.buf.format { async = true }
          end, opts)
        end,
      })

    end,
  },
}
