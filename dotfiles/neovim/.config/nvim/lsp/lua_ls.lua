-- LSP language server config
return {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  settings = {
    Lua = {
      diagnostics = {
          globals = { 'vim' },
      },
      -- Neovim embeds LuaJIT
      runtime = { version = 'LuaJIT' },
      workspace = {
        -- Don't prompt for 3rd party libraries
        checkThirdParty = false,
        library = { vim.env.VIMRUNTIME },
      }
    }
  }
}
