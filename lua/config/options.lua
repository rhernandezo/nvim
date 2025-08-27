-- vim.opt.smarttab = true   -- TODO: Buscar para que es

-- vim.opt.breakindent = true                       -- Enable break indent TODO: Buscar para que es

-- Basic settings
vim.opt.number = true                               -- Line numbers
vim.opt.relativenumber = true                       -- Relative line numbers
vim.opt.cursorline = true                           -- Highlight current line
vim.opt.wrap = false                                -- Don't wrap lines
vim.opt.scrolloff = 10                              -- Keep 10 lines above/below cursor
vim.opt.sidescrolloff = 8                           -- Keep 8 columns left/right of cursor

-- Indentation
vim.opt.tabstop = 2                                 -- Tab width
vim.opt.shiftwidth = 2                              -- Indent width
vim.opt.softtabstop = 2                             -- Soft tab stop
vim.opt.expandtab = true                            -- Use space instead of tabs
vim.opt.smartindent = true                          -- Smart auto-indentig
vim.opt.autoindent = true                           -- Copy indent from current line

-- Search settings
vim.opt.ignorecase = true                           -- Case insensitive search
vim.opt.smartcase = true                            -- Case sensitive if uppercase in search
vim.opt.hlsearch = false                            -- Don't highlight search result
vim.opt.incsearch = true                            -- Show matches as you type


-- Visual settings
-- vim.opt.termguicolors = true                        -- Enable 24-bit colors
-- vim.opt.signcolumn = "yes"                          -- Always show sign column                DANGER: Genera error
-- vim.opt.colorcolumn = "100"                         -- Show column at 100 characters
-- vim.opt.showmatch = true                            -- Highlight matching bracket
-- vim.opt.matchtime = 2                               -- How long to show matching bracket
-- vim.opt.cmdheight = 1                               -- Command line height
-- vim.opt.completeopt = "menuone,noinsert,noselect"   -- Completion options
-- vim.opt.showmode = false                            -- Don't show mode in command line
-- vim.opt.pumheight = 10                              -- Popup menu height
-- vim.opt.pumblend = 10                               -- Popup menu transparency
-- vim.opt.windblend = 10                              -- Floating window transparency
-- vim.opt.conceallevel = 0                            -- Don't hide markup
-- vim.opt.concealcursor = ""                          -- Don't hide cursor line markup
-- vim.opt.lazyredraw = true                           -- Don't redraw during macros
-- vim.opt.synmaxcol = 300                             -- Syntax highlighting limit 


-- Configure how new split should be opened
-- vim.opt.splitright = true
-- vim.opt.splitbelow = true

-- Disable commandline until it is needed. This gives us a clener look and an extra line
-- vim.opt.cmdheight = 0

-- Don't show the mode, since it's already in the status line
-- vim.opt.showmode = false

-- Set how neovim will display certain whitespace characters in the editor
-- See `:help 'list'`
-- and `:help 'listchars'`
-- vim.opt.list = true
-- vim.opt.listchars = { tab = "» ", trail = "•", nbsp = "︹" }
