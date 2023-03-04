-- Keymap Settings
-- NOTE: For plugin-specific keymaps, see the plugin config files

vim.g.mapleader = ' '

vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

----------------
-- Navigation --
----------------

-- Navigate between nvim and tmux panes (requires the vim-tmux-navigator plugin
-- in both nvim and tmux)
vim.keymap.set('n', '<C-h>', vim.cmd.TmuxNavigateLeft, {noremap = true,
  silent = true})
vim.keymap.set('n', '<C-j>', vim.cmd.TmuxNavigateDown, {noremap = true,
  silent = true})
vim.keymap.set('n', '<C-k>', vim.cmd.TmuxNavigateUp, {noremap = true,
  silent = true})
vim.keymap.set('n', '<C-l>', vim.cmd.TmuxNavigateRight, {noremap = true,
  silent = true})

--------------
-- Resizing --
--------------
vim.keymap.set('n', '<Up>', ':resize +2<cr>', {noremap = true})
vim.keymap.set('n', '<Down>', ':resize -2<cr>', {noremap = true})
vim.keymap.set('n', '<Left>', ':vertical resize +2<cr>', {noremap = true})
vim.keymap.set('n', '<Right>', ':vertical resize -2<cr>', {noremap = true})

---------------------
-- Quality of Life --
---------------------

-- Move selection up or down
vim.keymap.set('x', 'K', ':move \'<-2<cr>gv=gv', {noremap = true})
vim.keymap.set('x', 'J', ':move \'>+1<cr>gv=gv', {noremap = true})

-- Keep cursor still while appending lower lines
vim.keymap.set('n', 'J', 'mzJ`z')

-- Keep cursor still while jumping half a page
vim.keymap.set('n', '<c-d>', '<c-d>zz')
vim.keymap.set('n', '<c-u>', '<c-u>zz')

-- Center searches on correct line
vim.keymap.set('n', 'n', 'nzzzv', {noremap = true})
vim.keymap.set('n', 'N', 'Nzzzv', {noremap = true})

-- Reselect text after shifting it
vim.keymap.set('v', '<', '<gv', {noremap = true})
vim.keymap.set('v', '>', '>gv', {noremap = true})

-- Easy ; or , insertion
vim.keymap.set('i', ';;', '<Esc>A;<Esc>', {noremap = true})
vim.keymap.set('i', ',,', '<Esc>A,<Esc>', {noremap = true})

-- Edit file under cursor, creating if it doesn't exist
vim.keymap.set('n', 'gf', ':edit <cfile><cr>', {noremap = true})

-- Allow deletion without copy
vim.keymap.set({'n', 'v'}, '<leader>d', '"_d')
vim.keymap.set({'n', 'v'}, '<leader>dd', '"_dd')
vim.keymap.set({'n', 'v'}, '<leader>x', '"_x')
vim.keymap.set({'n', 'v'}, '<leader>x', '"_x')
vim.keymap.set({'n', 'v'}, '<leader>c', '"_c')
vim.keymap.set({'n', 'v'}, '<leader>c', '"_c')
vim.keymap.set({'n', 'v'}, '<leader>cc', '"_cc')

-- paste replace visual selection without copying it
vim.keymap.set('v', '<leader>p', '"_dP', {noremap = true})
