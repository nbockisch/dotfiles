-- LSP Settings
local status_ok, lsp = pcall(require, 'lsp-zero')
if not status_ok then
  return
end

-------------------
-- Initial Setup --
-------------------

lsp.preset('recommended')

-- Bootstrap Servers
lsp.ensure_installed({
  'angularls',
  'ansiblels',
  'bashls',
  'clangd',
  'cssls',
  'gopls',
  'html',
  'jdtls',
  'lemminx',
  'lua_ls',
  'pyright',
  'rust_analyzer',
  'texlab',
  'tsserver',
})

-----------------
-- Keybindings --
-----------------

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<c-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<c-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<c-y>'] = cmp.mapping.confirm({ select = true }),
  ['<c-space>'] = cmp.mapping.complete(),
  ['<Tab>'] = vim.NIL,
  ['<S-Tab>'] = vim.NIL,
  ['<cr>'] = vim.NIL,
})

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set('n', '[d', function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set('n', ']d', function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set('n', '<leader>ca', function() vim.lsp.buf.code_actions() end, opts)
  vim.keymap.set('n', '<leader>crr', function() vim.lsp.buf.references() end, opts)
  vim.keymap.set('n', '<leader>crn', function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set('n', '<leader>ch', function() vim.lsp.buf.signature_help() end, opts)
  vim.keymap.set('n', '<leader>cws', function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set('n', '<leader>cd', function() vim.diagnostic.open_float() end, opts)
end)

------------------
-- Finish Setup --
------------------

lsp.setup()
