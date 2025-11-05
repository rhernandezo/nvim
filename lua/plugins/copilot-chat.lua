return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
      -- See Configuration section for options
      question_header = '## Usuario ',
      answer_header = '## Copilot ',
      error_header = '## Error ',
      show_folds = true,
      show_help = true,
      auto_follow_cursor = true,
      auto_insert_mode = false,
      clear_chat_on_new_prompt = false,
      context = 'buffers', -- Usar buffers como contexto por defecto
      window = {
        layout = 'vertical', -- 'vertical', 'horizontal', 'float', 'replace'
        width = 0.5, -- fracción de la ventana principal
        height = 0.5,
        relative = 'editor',
      },
    },

    -- List of CopilotChat-related commands to be registered with Neovim.
    -- These commands provide various chat, code review, and automation features.
    cmd = {
      "CopilotChat",               -- Main chat interface command
      "CopilotChatOpen",           -- Open chat window
      "CopilotChatClose",          -- Close chat window
      "CopilotChatToggle",         -- Toggle chat window visibility
      "CopilotChatStop",           -- Stop current chat session
      "CopilotChatReset",          -- Reset chat context
      "CopilotChatSave",           -- Save chat history or context
      "CopilotChatLoad",           -- Load saved chat history or context
      "CopilotChatDebugInfo",      -- Show debug information
      "CopilotChatExplain",        -- Explain selected code
      "CopilotChatReview",         -- Review code for issues
      "CopilotChatFix",            -- Suggest fixes for code
      "CopilotChatOptimize",       -- Suggest optimizations
      "CopilotChatDocs",           -- Generate documentation
      "CopilotChatTests",          -- Generate tests
      "CopilotChatFixDiagnostic",  -- Fix diagnostics or errors
      "CopilotChatCommit",         -- Commit changes with message
      "CopilotChatCommitStaged",   -- Commit staged changes
    },

    keys = {
      -- Chat commands
      { "<leader>ccc", "<cmd>CopilotChat<cr>", desc = "CopilotChat - Chat" },
      { "<leader>cce", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
      { "<leader>cct", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" },
      { "<leader>ccr", "<cmd>CopilotChatReview<cr>", desc = "CopilotChat - Review code" },
      { "<leader>ccR", "<cmd>CopilotChatRefactor<cr>", desc = "CopilotChat - Refactor code" },
      { "<leader>ccn", "<cmd>CopilotChatBetterNamings<cr>", desc = "CopilotChat - Better Naming" },

      -- Chat with visual selection
      { "<leader>ccv", ":CopilotChatVisual", mode = "x", desc = "CopilotChat - Open in vertical split" },
      { "<leader>ccx", ":CopilotChatInline<cr>", mode = "x", desc = "CopilotChat - Inline chat" },

      -- Custom prompts for visual selection
      { "<leader>cce", ":CopilotChatExplain<cr>", mode = "x", desc = "CopilotChat - Explain code" },
      { "<leader>cct", ":CopilotChatTests<cr>", mode = "x", desc = "CopilotChat - Generate tests" },
      { "<leader>ccr", ":CopilotChatReview<cr>", mode = "x", desc = "CopilotChat - Review code" },
      { "<leader>ccR", ":CopilotChatRefactor<cr>", mode = "x", desc = "CopilotChat - Refactor code" },
      { "<leader>ccn", ":CopilotChatBetterNamings<cr>", mode = "x", desc = "CopilotChat - Better Naming" },
      { "<leader>ccd", ":CopilotChatDocs<cr>", mode = "x", desc = "CopilotChat - Generate Docs" },
      { "<leader>ccf", ":CopilotChatFixDiagnostic<cr>", mode = "x", desc = "CopilotChat - Fix Diagnostic" },
      { "<leader>cco", ":CopilotChatOptimize<cr>", mode = "x", desc = "CopilotChat - Optimize code" },

      -- Toggle and window management
      { "<leader>cq", function()
        local input = vim.fn.input("Quick Chat: ")
        if input ~= "" then
          vim.cmd("CopilotChat " .. input)
        end
      end, desc = "CopilotChat - Quick chat" },
      { "<leader>ch", "<cmd>CopilotChatToggle<cr>", desc = "CopilotChat - Toggle" },
      { "<leader>cx", "<cmd>CopilotChatClose<cr>", desc = "CopilotChat - Close" },
      { "<leader>cr", "<cmd>CopilotChatReset<cr>", desc = "CopilotChat - Reset" },

      -- Commit functions
      -- { "<leader>ccm", "<cmd>CopilotChatCommit<cr>", desc = "CopilotChat - Generate commit message for all changes" },
      -- { "<leader>ccM", "<cmd>CopilotChatCommitStaged<cr>", desc = "CopilotChat - Generate commit message for staged changes" },

      -- Debug and info
      { "<leader>ccd", "<cmd>CopilotChatDebugInfo<cr>", desc = "CopilotChat - Debug Info" },

      -- Custom workflow keymaps
      { "<leader>cww", function()
        vim.ui.input({
          prompt = "Workshop - Ask Copilot: ",
          default = "",
        }, function(input)
          if input and input ~= "" then
            vim.cmd("CopilotChat " .. input)
          end
        end)
      end, desc = "CopilotChat - Workshop question" },

      { "<leader>cwp", function()
        local input = vim.fn.input("Ask about current project: ")
        if input ~= "" then
          vim.cmd("CopilotChat " .. input .. " Analiza todo mi proyecto y proporciona una respuesta completa.")
        end
      end, desc = "CopilotChat - Project analysis" },
    },
    config = function(_, opts)
      local chat = require("CopilotChat")
      local select = require("CopilotChat.select")

      -- Configurar el plugin
      chat.setup(opts)

      -- Prompts personalizados útiles
      vim.api.nvim_create_user_command("CopilotChatVisual", function(args)
        chat.ask(args.args, { selection = select.visual })
      end, { nargs = "*", range = true })

      -- Inline chat command
      vim.api.nvim_create_user_command("CopilotChatInline", function(args)
        chat.ask(args.args, {
          selection = select.visual,
          window = {
            layout = "float",
            relative = "cursor",
            width = 1,
            height = 0.4,
            row = 1,
          },
        })
      end, { nargs = "*", range = true })

      -- Buffer chat command
      vim.api.nvim_create_user_command("CopilotChatBuffer", function(args)
        chat.ask(args.args, { selection = select.buffer })
      end, { nargs = "*" })
    end,

  },
}
