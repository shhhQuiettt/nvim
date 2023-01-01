local opts = {noremap=true, silent=true}
local bufopts = { noremap=true, silent=true, buffer=0 }

-- cmp capabilities
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local lspconfig = require("lspconfig")
local function on_attach()
    vim.keymap.set('n', '[k', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', '[j', vim.diagnostic.goto_next, opts)

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)


    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)

    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)

    vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end


--servers
lspconfig.pyright.setup{
    on_attach = on_attach,
    capabilities = capabilities
}

lspconfig.sumneko_lua.setup{
    on_attach = on_attach,
    capabilities = capabilities
}
