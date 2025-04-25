-- These must be set before using lazy
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- The order of these matters!
require('plugin-manager')
require('keys')
require('general')
