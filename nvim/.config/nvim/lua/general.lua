-- General Settings

-----------------------
-- Editor Appearance --
-----------------------

-- Line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Cursor
vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"

-- Don't scroll past this many rows/columns
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- Show signs (used by the LSP) and max column length
vim.opt.signcolumn = 'yes'
vim.opt.colorcolumn = '80'

-- Don't wrap around
vim.opt.wrap = false

-- Show trailing spaces and tabs
vim.opt.list = true
vim.opt.listchars = "tab: ,trail:."

-- Vertical splits go right
vim.opt.splitright = true

-- Global status line
vim.opt.laststatus = 3

-----------------
-- Indentation --
-----------------

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Per-filetype tabs
local changetabs = function(num)
  vim.cmd("setlocal shiftwidth=" .. num)
  vim.cmd("setlocal softtabstop=" .. num)
end

-- Put files with 2 space tabs here
vim.api.nvim_create_autocmd(
  {"BufEnter", "BufWinEnter"},
  {
    pattern = {"*.lua"},
    callback = function() changetabs(2) end,
  }
)

---------------
-- Searching --
---------------

-- Don't leave matches highlighted
vim.opt.hlsearch = false

-- Incrementally highlight pattern matching while typing
vim.opt.incsearch = true

-- How do we treat cases
vim.opt.ignorecase = true
vim.opt.smartcase = true

------------
-- Colors --
------------

vim.opt.termguicolors = true

vim.cmd.colorscheme('aquarium')
vim.g.aqua_bold = 1
vim.g.aquarium_style="dark"

-- Set the color scheme or use a default value
-- function SetColor(color)
--   color = color or "aquarium"
--   vim.cmd.colorscheme(color)
--
--   vim.opt.background = "dark"
-- end

-- SetColor()

-------------------
-- Undo Settings --
-------------------

-- Backups are handled by UndoTree, give it access to long-running undos
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"
vim.opt.undofile = true

----------
-- Misc --
----------

vim.opt.isfname:append('@-@')
-- Use _ as a word break
vim.opt.iskeyword:remove('-')

vim.opt.updatetime = 50

-- Tab complete setting
vim.opt.wildmode = "longest:full,full"

-- Use system clipboard
vim.opt.clipboard = vim.opt.clipboard + 'unnamedplus'

-- Mouse bad
vim.opt.mouse = ""
