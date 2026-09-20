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
