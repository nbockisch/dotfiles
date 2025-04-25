-- Tab vim.keymap.setings
vim.keymap.set('n', '<Tab>', 'gt', {noremap = true})
vim.keymap.set('n', '<S-Tab>', 'gT', {noremap = true})
vim.keymap.set('n', '<A-t>', ':tabnew<CR>', {noremap = true})
vim.keymap.set('n', '<A-h>', ':tabmove -<CR>', {noremap = true})
vim.keymap.set('n', '<A-l>', ':tabmove +<CR>', {noremap = true})

-- Split resizing
vim.keymap.set('n', '<Up>', ':resize +2<CR>', {noremap = true})
vim.keymap.set('n', '<Down>', ':resize -2<CR>', {noremap = true})
vim.keymap.set('n', '<Left>', ':vertical resize +2<CR>', {noremap = true})
vim.keymap.set('n', '<Right>', ':vertical resize -2<CR>', {noremap = true})

-- Navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', {noremap = true})
vim.keymap.set('n', '<C-j>', '<C-w>j', {noremap = true})
vim.keymap.set('n', '<C-k>', '<C-w>k', {noremap = true})
vim.keymap.set('n', '<C-l>', '<C-w>l', {noremap = true})

-- navigate in insert mode
vim.keymap.set('i', '<C-h>', '<Left>', {noremap = true})
vim.keymap.set('i', '<C-j>', '<Down>', {noremap = true})
vim.keymap.set('i', '<C-k>', '<Up>', {noremap = true})
vim.keymap.set('i', '<C-l>', '<Right>', {noremap = true})

-- Quality of life improvements
vim.keymap.set('i', 'jj', '<Esc>'); -- Enter normal mode in a more convenient way
vim.keymap.set('x', 'K', ':move \'<-2<CR>gv-gv', {noremap = true}) -- move selected
vim.keymap.set('x', 'J', ':move \'>+1<CR>gv-gv', {noremap = true})
vim.keymap.set('n', 'gf', ':edit <cfile><CR>', {noremap = true}) -- Edit file under cursor

vim.keymap.set('v', '<', '<gv', {noremap = true}) -- reselect text after shifting it
vim.keymap.set('v', '>', '>gv', {noremap = true})

vim.keymap.set('v', '<leader>p', '"_dP', {noremap = true}) -- paste replace visual
                                                 -- selection without copying it

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

-- File explorer
vim.keymap.set('n', '<leader>pv', ':Oil<CR>', {noremap = true})

-- Fuzzy find
vim.keymap.set('n', '<leader>ff', ':FzfLua files<CR>', {noremap = true})
vim.keymap.set('n', '<leader>fg', ':FzfLua live_grep<CR>', {noremap = true})
vim.keymap.set('n', '<leader>fc', ':FzfLua lgrep_curbuf<CR>', {noremap = true})
vim.keymap.set('n', '<leader>fq', ':FzfLua quickfix<CR>', {noremap = true})
vim.keymap.set('n', '<leader>fb', ':FzfLua buffers<CR>', {noremap = true})
vim.keymap.set('n', '<leader>fb', ':FzfLua buffers<CR>', {noremap = true})

-- Git buffer integration
vim.keymap.set('n', '<leader>hb', ':Gitsigns toggle_current_line_blame<CR>', {noremap = true})
