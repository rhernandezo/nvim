-- Function to open all modified files in buffers
function OpenModifiedFiles()
  local handle = io.popen('git ls-files -m')
  if handle then
    local result = handle:read('*a')
    handle:close()
    for file in result:gmatch('[^\r\n]+') do
      vim.cmd('edit ' .. file)
    end
  else
    print('Git not found or no modified files')
  end
end

return {
  -- Plugin: snacks.nvim
  -- URL: https://github.com/folke/snacks.nvim/tree/main
  -- Description: A Neovim plugin for creating a customizable dashboard.
  {
    "folke/snacks.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      notifier = {},
      image = {},
      picker = {
        exclude = {
          ".git",
          "node_modules",
        },
        matcher = {
          fuzzy = true,
          smartcase = true,
          ignorecase = true,
          filename_bonus = true,
        },
        sources = {
          -- explorer = {
            --   matcher = {
              --     fuzzy = true, -- Enables fuzzy matching, so you can be a bit imprecise with your search terms
              --     smartcase = true, -- If your search term has uppercase letters, the search becomes case-sensitive
              --     ignorecase = true, -- Ignores case when searching, unless smartcase is triggered
              --     filename_bonus = true, -- Gives a higher priority to matches in filenames
              --     sort_empty = false, -- If no matches are found, it won't sort the results
              --   },
              -- },
            },
          },
          dashboard = {
            sections = {
              { section = "header" },
              { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
              { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
              { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
              { section = "startup" },
            },
            preset = {
              header = [[
██╗    ██╗██╗ ██████╗██╗  ██╗ ██████╗ 
██║    ██║██║██╔════╝██║  ██║██╔═══██╗
██║ █╗ ██║██║██║     ███████║██║   ██║
██║███╗██║██║██║     ██╔══██║██║   ██║
╚███╔███╔╝██║╚██████╗██║  ██║╚██████╔╝
╚══╝╚══╝ ╚═╝ ╚═════╝╚═╝  ╚═╝ ╚═════╝ 
              ]],
              -- stylua: ignore
              ---@type snacks.dashboard.Item[]
              keys = {
                { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
                { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
                { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
                { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
                { icon = " ", key = "m", desc = "Open Modified Files in Buffers", action = ":lua OpenModifiedFiles()" },
                { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
                { icon = " ", key = "s", desc = "Restore Session", section = "session" },
                { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
                { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
                { icon = " ", key = "q", desc = "Quit", action = ":qa" },
              },
            },
          },
        },
        keys = {
          -- Top Pickers & Explorer
          { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
          { "<leader>,", function() Snacks.picker.buffers() end, desc = "Buffers" },
          { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep" },
          { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
          { "<leader>n", function() Snacks.picker.notifications() end, desc = "Notification History" },
          { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },

          -- find
          { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
          { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
          { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
          { "<leader>fg", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
          { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
          { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent" },

          -- LSP
          { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
          { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
          { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
          { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
          { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
          { "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
          { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
        },
      },
}
