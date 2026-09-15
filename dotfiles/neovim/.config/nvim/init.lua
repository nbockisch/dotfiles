-- Colors (Dynamically sourced based on the selected color scheme)
local scheme = os.getenv('HOME') .. '/.config/colors/current/nvim.lua'

local function load_colors()
	local ok, err = pcall(dofile, scheme)
	if not ok then
		vim.notify('colors: ' .. tostring(err), vim.log.levels.WARN)
	end
end

load_colors()

-- appearance-menu.sh sends SIGUSR1 after repointing the current symlink
vim.api.nvim_create_autocmd('Signal', {
	pattern = 'SIGUSR1',
	callback = load_colors
})

-- Tmux navigation
vim.pack.add({ 'https://github.com/christoomey/vim-tmux-navigator' })

vim.keymap.set('n', '<C-h>', vim.cmd.TmuxNavigateLeft, { noremap = true, silent = true })
vim.keymap.set('n', '<C-j>', vim.cmd.TmuxNavigateDown, { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', vim.cmd.TmuxNavigateUp, { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', vim.cmd.TmuxNavigateRight, { noremap = true, silent = true })

-- quick navigate panes
vim.keymap.set('i', '<C-h>', '<Left>', { noremap = true })
vim.keymap.set('i', '<C-j>', '<Down>', { noremap = true })
vim.keymap.set('i', '<C-k>', '<Up>', { noremap = true })
vim.keymap.set('i', '<C-l>', '<Right>', { noremap = true })

-- use the system clipboard
vim.opt.clipboard="unnamedplus"
