-- Editor appearance settings
vim.cmd.colorscheme("neopywal")
vim.opt.background = "dark"

-- Background transparency
vim.cmd [[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
]]

vim.opt.number = true
vim.opt.relativenumber = true -- set line numbers as relative to cursor
vim.opt.scrolloff = 8 -- minimum lines above or below cursor
vim.opt.sidescrolloff = 8 -- minimum columns next to cursor
vim.opt.signcolumn = "yes" -- allow lefthand column for alerts
vim.opt.wrap = false -- let trailing text go off the screen
vim.opt.title = true -- set neovim's title in terminal
vim.opt.list = true -- show trailing spaces and tabs
vim.opt.listchars = "tab: ,trail:." -- chars to show trailing spaces/tabs
vim.opt.splitright = true -- put vertical splits to the right
vim.opt.colorcolumn = "80" -- show line at 80 cols to not exceed that

-- Tab settings
vim.opt.autoindent = true -- autoindent from previous line
vim.opt.expandtab = true -- use spaces instead of tabs
vim.opt.shiftwidth = 0 -- make >, and < always use tabstop value
vim.opt.tabstop = 2 -- number of spaces a <tab> counts for

-- Tab complete settings
vim.opt.wildmode = "longest:full,full"

-- Undo settings
vim.opt.hidden = true -- preserve buffer info and undos
vim.opt.undofile = true -- enable undo files
vim.opt.undodir = os.getenv("HOME") .. '/.config/nvim/undodir' -- undo files here

-- Search settings
vim.opt.hlsearch = false -- don't leave matches highlighted
vim.opt.ignorecase = true -- ignore case when searching
vim.opt.smartcase = true -- ignore ignorecase if search pattern has capitals
vim.opt.incsearch = true -- show where pattern matches while typing

-- Copy with the system clipboard
vim.opt.clipboard = "unnamedplus"
