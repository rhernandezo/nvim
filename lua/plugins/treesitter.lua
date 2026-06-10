return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  branch = "main",
  build = ":TSUpdate",
  config = function()
    -- Registrar el filetype PRIMERO
    vim.filetype.add({
      pattern = {
        [".*%.blade%.php"] = "blade",
      },
    })

    -- Registrar el parser de blade con la nueva API
    -- (debe hacerse antes o durante TSUpdate, no con get_parser_configs)
    vim.api.nvim_create_autocmd("User", {
      pattern = "TSUpdate",
      callback = function()
        require("nvim-treesitter.parsers").blade = {
          install_info = {
            url = "https://github.com/EmranMR/tree-sitter-blade",
            files = { "src/parser.c" },
            branch = "main",
          },
        }
      end,
    })

    -- También registrarlo directamente por si TSUpdate ya corrió
    require("nvim-treesitter.parsers").blade = {
      install_info = {
        url = "https://github.com/EmranMR/tree-sitter-blade",
        files = { "src/parser.c" },
        branch = "main",
      },
    }

    -- Setup con la nueva API
    require("nvim-treesitter").setup({
      ensure_installed = {
        "javascript", "lua", "vim", "vimdoc", "html", "css",
        "scss", "vue", "php", "php_only", "typescript", "json",
      },
    })

    -- Activar highlight (en la nueva versión es explícito por filetype)
    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "javascript", "typescript", "lua", "html", "css", "scss",
        "vue", "php", "json", "blade",
      },
      callback = function()
        vim.treesitter.start()
      end,
    })
  end,
}


--[[return {
  "nvim-treesitter/nvim-treesitter",
  version = false, -- Recomendado para usar la versión más reciente
  build = ":TSUpdate",
  opts = {
    ensure_installed = { 
      "javascript", "lua", "vim", "vimdoc", "html", "css", 
      "scss", "vue", "php", "typescript", "json" 
      -- Quitamos "blade" de aquí para evitar que falle antes de registrarlo
    },
    highlight = { enable = true },
    indent = { enable = true },
  },
  config = function(_, opts)
    -- 1. Registrar el parser de Blade manualmente
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
    parser_config.blade = {
      install_info = {
        url = "https://github.com/EmranMR/tree-sitter-blade",
        files = { "src/parser.c" },
        branch = "main",
      },
      filetype = "blade",
    }

    -- 2. Setup (Nueva API v1.0.0+)
    require("nvim-treesitter").setup(opts)
  end,
}]]

--[[ return {
  "nvim-treesitter/nvim-treesitter",
  version = false,
  build = ":TSUpdate",
  opts = {
    -- Asegura que se instalen estos primero
    ensure_installed = { "javascript", "lua", "vim", "vimdoc",
      "html",
      "css",
      "scss",
      "vue",
      "php",
      "blade",
      "typescript",
      "json"
    },
    
    -- Si tienes problemas de red o de compilación, pon esto en true
    prefer_git = false, 

    highlight = { enable = true },
    indent = { enable = true },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<Enter>",
        node_incremental = "<Enter>",
        scope_incremental = false,
        node_decremental = "<Backspace>",
      },
    },
  },
  config = function(_, opts)
    -- Esta es la forma segura de cargar la configuración en la nueva versión
    local status, ts_configs = pcall(require, "nvim-treesitter.configs")
    if status then
        ts_configs.setup(opts)
    else
        -- Fallback si el módulo 'configs' no existe (Versión 1.0+)
        require('nvim-treesitter').setup(opts)
    end

    -- 1. REGISTRO MANUAL DEL PARSER DE BLADE
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
    parser_config.blade = {
      install_info = {
        url = "https://github.com/EmranMR/tree-sitter-blade", -- Repositorio del parser
        files = { "src/parser.c" },
        branch = "main",
      },
      filetype = "blade",
    }

    -- 2. CARGA DE LA CONFIGURACIÓN
    local status, ts_configs = pcall(require, "nvim-treesitter.configs")
    if status then
        ts_configs.setup(opts)
    else
        require('nvim-treesitter').setup(opts)
    end

  end,
} ]]


--[[ return {
  {
    "nvim-treesitter/nvim-treesitter",
    -- enabled = false,
    build = ":TSUpdate",
    config = function () 

      require('nvim-treesitter.configs').setup({
            -- Tu configuración aquí

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
                "json",
                "blade",
                "yaml",
                "markdown",
                "markdown_inline",
                -- "latex",
                "norg",
                "svelte",
                "tsx",
                "typst"
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
} ]]
