-- Mason Settings
local status_ok, mason = pcall(require, 'mason')
if not status_ok then
  return
end

local status_ok, mason_lsp = pcall(require, 'mason-lspconfig')
if not status_ok then
  return
end

mason.setup {
  ui = {
    icons = {
      package_installed = '✓',
      package_pending = '➜',
      package_uninstalled = '✗',
      error = '✗',
      warn = '▲',
      hint = '⚑',
      info = '',
    }
  }
}

mason_lsp.setup {
  -- Bootstrap Servers
  ensure_installed = {
    'angularls',
    'ansiblels',
    'bashls',
    'clangd',
    'cssls',
    'dockerls',
    'gopls',
    'html',
    'jdtls',
    'lemminx',
    'lua_ls',
    'marksman',
    'pyright',
    'rome',
    'rust_analyzer',
    'texlab',
    'tsserver',
  }
}

-- Set up LSP servers
mason_lsp.setup_handlers {
  function (server_name)
      require("lspconfig")[server_name].setup {}
  end,
}
