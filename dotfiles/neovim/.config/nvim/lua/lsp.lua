vim.cmd('set completeopt+=noselect') -- Don't automatically fill in the first suggestion

vim.lsp.enable({
    'lua_ls',
    'rust_analyzer',
})

vim.diagnostic.config({
    virtual_text = false,
    jump = {
        on_jump = function(_, bufnr)
            -- Schedule the float window to ensure the cursor has settled on the error
            vim.schedule(function()
                if vim.api.nvim_buf_is_valid(bufnr) then
                    vim.diagnostic.open_float({
                        bufnr = bufnr,
                        scope = 'cursor',
                        focus = false,
                        source = true
                    })
                end
            end)
        end,
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '✘',
            [vim.diagnostic.severity.WARN]  = '▲',
            [vim.diagnostic.severity.HINT]  = '⚑',
            [vim.diagnostic.severity.INFO]  = '»',
        },
    },
})
