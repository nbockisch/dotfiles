vim.pack.add{
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  { src = 'https://github.com/RedsXDD/neopywal.nvim', as = 'neopywal', dst = '~/.config/wallust/templates/colors_neopywal.vim' }
}

require('plugins.nvim_lspconfig')
require('plugins.neopywal')
