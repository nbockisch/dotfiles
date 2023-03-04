-- Telescope Settings
local status_ok, builtin = pcall(require, 'telescope.builtin')
if not status_ok then
  return
end

-------------
-- Pickers --
-------------

-- Search with hidden files included
vim.keymap.set(
  'n',
  '<leader>fh',
  '<cmd>'..
  'lua require(\'telescope.builtin\')'..
  '.find_files({ hidden = true })'..
  '<cr>',
  {}
)
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fc', builtin.current_buffer_fuzzy_find, {})
vim.keymap.set('v', '<leader>fs', builtin.grep_string, {})
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
vim.keymap.set('n', '<leader>gm', builtin.marks, {})
vim.keymap.set('n', '<leader>gj', builtin.jumplist, {})
vim.keymap.set('n', '<leader>gr', builtin.registers, {})
vim.keymap.set('n', '<leader>gt', builtin.planets, {})
