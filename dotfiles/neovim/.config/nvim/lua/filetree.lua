vim.g.netrw_altfile = 1 -- keep the alternative file correct
vim.g.netrw_banner = 0 -- hide the top banner
vim.g.netrw_browse_split = 0 -- open files in previous window
vim.g.netrw_liststyle = 3 -- tree view
vim.g.netrw_winsize = 25

vim.keymap.set('n', '<leader>e', ':Lexplore<cr>', { silent = true })
