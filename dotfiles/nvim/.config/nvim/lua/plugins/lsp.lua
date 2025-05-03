return {
  {
    'williamboman/mason.nvim',
    opts = {}
  },
  {
    'williamboman/mason-lspconfig.nvim',
    opts = {
      ensure_installed = {
        "angularls",
        "ansiblels",
        "ast_grep",
        "bashls",
        "biome",
        "clangd",
        "csharp_ls",
        "cssls",
        "denols",
        "dockerls",
        "eslint",
        "gopls",
        "helm_ls",
        "html",
        "jdtls",
        "jsonls",
        "lua_ls",
        "marksman",
        "rust_analyzer",
        "snyk_ls",
        "sqlls",
        "svelte",
        "terraformls",
        "ts_ls",
        "vimls",
        "yamlls",
        "zls"
      },
    },
    dependencies = {
      { 'williamboman/mason.nvim', opts = {} }
    }
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      local lspconfig = require('lspconfig')
      lspconfig.angularls.setup {}
      lspconfig.ansiblels.setup {}
      lspconfig.ast_grep.setup {}
      lspconfig.bashls.setup {}
      lspconfig.biome.setup {}
      lspconfig.clangd.setup {}
      lspconfig.csharp_ls.setup {}
      lspconfig.cssls.setup {}
      lspconfig.denols.setup {}
      lspconfig.dockerls.setup {}
      lspconfig.eslint.setup {}
      lspconfig.gopls.setup {}
      lspconfig.helm_ls.setup {}
      lspconfig.html.setup {}
      lspconfig.jdtls.setup {}
      lspconfig.jsonls.setup {}
      lspconfig.lua_ls.setup {}
      lspconfig.marksman.setup {}
      lspconfig.rust_analyzer.setup {}
      lspconfig.snyk_ls.setup {}
      lspconfig.sqlls.setup {}
      lspconfig.terraformls.setup {}
      lspconfig.ts_ls.setup {}
      lspconfig.vimls.setup {}
      lspconfig.yamlls.setup {}
      lspconfig.zls.setup {}
      lspconfig.svelte.setup {}
    end
  }
}
