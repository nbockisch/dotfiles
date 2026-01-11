vim.lsp.enable('bashls');
vim.lsp.enable('ccls');
vim.lsp.enable('cssls')
vim.lsp.enable('deno')
vim.lsp.enable('docker_language_server')
vim.lsp.enable('gopls')
vim.lsp.enable('html')
vim.lsp.enable('pyright')
vim.lsp.enable('rust_analyzer')
vim.lsp.enable('svelte')
vim.lsp.enable('tailwindcss')

-- Autocomplete
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        vim.lsp.completion.enable(true, ev.data.client_id, ev.buf, { autotrigger = false })
    end,
})
