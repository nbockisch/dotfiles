require('plugins')
require('lsp')
require('treesitter')

-- Colorscheme
require("neopywal").setup({
    use_palette = {
      light = "wallust",
      dark = "wallust",
    },
})
vim.cmd.colorscheme("neopywal")
