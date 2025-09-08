-- Buffer navigation
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })

-- Splitting & Resizing (TODO)
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", ":split<CR>", { desc = "Split window horizontally" })
-- vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
-- vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
-- vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
-- vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Move lines up/down
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Better indenting in visual mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- OIL
vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })

-- CopilotChat keymaps adicionales
-- map("n", "<leader>ai", function()
--   local input = vim.fn.input("AI Quick Question: ")
--   if input ~= "" then
--     require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
--   end
-- end, { desc = "AI Quick Question" })
--
-- -- Keymaps para acceso rápido a funciones comunes de AI
-- map({ "n", "v" }, "<leader>ae", "<cmd>CopilotChatExplain<cr>", { desc = "AI Explain" })
-- map({ "n", "v" }, "<leader>af", "<cmd>CopilotChatFix<cr>", { desc = "AI Fix" })
-- map({ "n", "v" }, "<leader>ao", "<cmd>CopilotChatOptimize<cr>", { desc = "AI Optimize" })
-- map({ "n", "v" }, "<leader>ad", "<cmd>CopilotChatDocs<cr>", { desc = "AI Documentation" })
-- map({ "n", "v" }, "<leader>at", "<cmd>CopilotChatTests<cr>", { desc = "AI Tests" })
--
-- -- Toggle rápido del chat
-- map("n", "<leader>ac", "<cmd>CopilotChatToggle<cr>", { desc = "AI Chat Toggle" })
--
-- -- Chat con selección visual más intuitivo
-- map("v", "<leader>ac", ":CopilotChatVisual<cr>", { desc = "AI Chat with Selection" })
--
-- -- Workflow de desarrollo con AI
-- map("n", "<leader>aw", function()
--   local actions = {
--     "Explain this code",
--     "Review this code", 
--     "Fix this code",
--     "Optimize this code",
--     "Generate tests",
--     "Generate documentation",
--     "Refactor this code",
--     "Better variable names"
--   }
--
--   vim.ui.select(actions, { prompt = "AI Action:" }, function(choice)
--     if choice then
--       vim.cmd("CopilotChat " .. choice)
--     end
--   end)
-- end, { desc = "AI Workflow Menu" })

