-- Add plugins to install here and source their config files

-- Packages to install go here
local PKGS = {
  -- Have Paq manage itself
  'savq/paq-nvim';

  -- Boilerplate plugins
  'nvim-lua/plenary.nvim'; -- contains functions used by other plugins

  -- Bar
  'nvim-lualine/lualine.nvim';

  -- Navigation
  'nvim-telescope/telescope.nvim';
  {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'};
  'christoomey/vim-tmux-navigator';

  -- Undoing
  'mbbill/undotree';

  -- Autocompletion Setup
  {'VonHeikemen/lsp-zero.nvim', branch = 'v1.x'};

  -- LSP Support
  'neovim/nvim-lspconfig';
  'williamboman/mason.nvim';
  'williamboman/mason-lspconfig.nvim';

  -- Autocompletion Engine
  'hrsh7th/nvim-cmp';
  'hrsh7th/cmp-nvim-lsp';
  'hrsh7th/cmp-buffer';
  'hrsh7th/cmp-path';
  'saadparwaiz1/cmp_luasnip';
  'hrsh7th/cmp-nvim-lua';

  -- Snippets
  'L3MON4D3/LuaSnip';
  'rafamadriz/friendly-snippets';

  -- Colors
  'frenzyexists/aquarium-vim';
  {'nvim-treesitter/nvim-treesitter', run = TSUpdate};
  'ap/vim-css-color'; -- highlight RGB colors
}

-- Make sure paq is on system
local function clone_paq()
  local path = vim.fn.stdpath('data') .. '/site/pack/paqs/start/paq-nvim'
  if vim.fn.empty(vim.fn.glob(path)) > 0 then
    vim.fn.system {
      'git',
      'clone',
      '--depth=1',
      'https://github.com/savq/paq-nvim.git',
      path
    }
  end
end

-- Bootstrap Paq and plugins
local function bootstrap_paq()
  -- Make sure paq is on system
  clone_paq()

  -- Load Paq
  vim.cmd('packadd paq-nvim')
  local paq = require('paq')

  -- Read and install packages
  paq(PKGS)
  paq.install()
end

bootstrap_paq()

-- Plugin configs
require('plugins.nvim-treesitter')
require('plugins.telescope')
require('plugins.undotree')
require('plugins.lsp')
require('plugins.lualine')
