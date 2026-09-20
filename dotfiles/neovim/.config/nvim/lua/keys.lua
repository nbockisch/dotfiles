vim.g.mapleader = ' '

-- Tmux navigation
vim.pack.add({ 'https://github.com/christoomey/vim-tmux-navigator' })

vim.keymap.set('n', '<C-h>', vim.cmd.TmuxNavigateLeft, { noremap = true, silent = true })
vim.keymap.set('n', '<C-j>', vim.cmd.TmuxNavigateDown, { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', vim.cmd.TmuxNavigateUp, { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', vim.cmd.TmuxNavigateRight, { noremap = true, silent = true })

-- Quick navigate panes
vim.keymap.set('i', '<C-h>', '<Left>', { noremap = true })
vim.keymap.set('i', '<C-j>', '<Down>', { noremap = true })
vim.keymap.set('i', '<C-k>', '<Up>', { noremap = true })
vim.keymap.set('i', '<C-l>', '<Right>', { noremap = true })

-- Quality of life improvements
vim.keymap.set('i', 'jj', '<Esc>'); -- Enter normal mode in a more convenient way
vim.keymap.set('x', 'K', ':move \'<-2<CR>gv-gv', {noremap = true}) -- move selected
vim.keymap.set('x', 'J', ':move \'>+1<CR>gv-gv', {noremap = true})
vim.keymap.set('n', 'gf', ':edit <cfile><CR>', {noremap = true}) -- Edit file under cursor

vim.keymap.set('v', '<', '<gv', {noremap = true}) -- reselect text after shifting it
vim.keymap.set('v', '>', '>gv', {noremap = true})

vim.keymap.set('v', '<leader>p', '"_dP', {noremap = true}) -- paste replace visual selection without copying it

vim.keymap.set('n', 'n', 'nzzzv', {noremap = true}) -- center searches on right line
vim.keymap.set('n', 'N', 'Nzzzv', {noremap = true})

vim.keymap.set('v', '<leader>d', '"_d', {noremap = true}) -- Allow deletion without copy
vim.keymap.set('n', '<leader>dd', '"_dd', {noremap = true})
vim.keymap.set('n', '<leader>x', '"_x', {noremap = true})
vim.keymap.set('v', '<leader>x', '"_x', {noremap = true})
vim.keymap.set('n', '<leader>c', '"_c', {noremap = true})
vim.keymap.set('v', '<leader>c', '"_c', {noremap = true})
vim.keymap.set('n', '<leader>cc', '"_cc', {noremap = true})

-- vim.keymap.set('n', '<leader>o', ':!xdg-open %<CR><CR>', {noremap = true}) -- open current
--                                                                  -- file in
--                                                                  -- default
--                                                                  -- program

vim.keymap.set('i', ';;', '<Esc>A;<Esc>', {noremap = true}) -- easy ; or , insertion
vim.keymap.set('i', ',,', '<Esc>A,<Esc>', {noremap = true})

-- LSP
vim.keymap.set('n', 'g]', function() vim.diagnostic.jump({ count = 1 }) end, { desc = "Go to next error" })
vim.keymap.set('n', 'g[', function() vim.diagnostic.jump({ count = -1 }) end, { desc = "Go to previous error" })
vim.keymap.set('n', 'gld', vim.diagnostic.open_float, { desc = "Show line diagnostics" })
