vim.pack.add{
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  { src = 'https://github.com/nvim-tree/nvim-web-devicons' }, -- Dependency for fzf-lua
  { src = 'https://github.com/ibhagwan/fzf-lua' },
  { src = 'https://github.com/RedsXDD/neopywal.nvim', as = 'neopywal', dst = '~/.config/wallust/templates/colors_neopywal.vim' },
  { src = 'https://github.com/christoomey/vim-tmux-navigator' }
}

require('plugins.nvim_lspconfig')
require('plugins.fzf_lua')
require('plugins.neopywal')
