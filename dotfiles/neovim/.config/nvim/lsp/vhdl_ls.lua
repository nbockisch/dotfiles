-- VHDL language server config
return {
  cmd = { 'vhdl_ls' },
  filetypes = { 'vhd', 'vhdl' },
  root_markers = {
    'vhdl_ls.toml',
  },
  workspace_required = true,
}
