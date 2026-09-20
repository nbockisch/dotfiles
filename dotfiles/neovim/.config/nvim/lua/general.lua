-- UI settings
vim.o.autoread = true -- See changes in Neovim when edited outside of Neovim
vim.o.cmdheight = 0 -- Hide the command line when not in use
vim.o.colorcolumn = '80' -- show line at 80 cols
vim.o.laststatus = 3 -- Single global status line
vim.o.list = true -- show trailing spaces and tabs
vim.o.listchars = 'tab: ,trail:.' -- chars to show trailing spaces/tabs
vim.o.number = true
vim.o.relativenumber = true -- set line numbers relative to the cursor
vim.o.scrolloff = 8 -- minimum lines above or below the cursor
vim.o.sidescrolloff = 8 -- minimum columns next to the cursor
vim.o.signcolumn = 'yes' -- allow lefthand column for alerts
vim.o.splitright = true -- put vertical splits to the right
vim.o.title = true -- set neovim's title in the terminal
vim.o.wrap = false -- let trailing text go off the screen
vim.g.netrw_banner = 0 -- hide the top banner of netrw

-- Find settings

-- Tab settings
vim.o.autoindent = true -- autoindent from previous line
vim.o.expandtab = true -- use spaces instead of tabs
vim.o.shiftwidth = 0 -- make >, and < always use the tabstop value
vim.o.tabstop = 4 -- number of spaces a <tab> counts for
vim.o.wildmode = 'list:longest' -- list all matches and complete until the longest common prefix

-- Undo settings
vim.o.hidden = true -- preserve buffer info and undos
vim.o.undofile = true -- enable undo files
vim.o.undodir = os.getenv('HOME') .. '/.config/nvim/undodir' -- undo files go here

-- Search settings
vim.o.hlsearch = false -- don't leave matches highlighted
vim.o.ignorecase = true -- ignore case when searching
vim.o.smartcase = true -- ignore ignorecase if search pattern has capitals
vim.o.incsearch = true -- show where pattern matches while typing

-- Use the system clipboard
vim.o.clipboard="unnamedplus"
