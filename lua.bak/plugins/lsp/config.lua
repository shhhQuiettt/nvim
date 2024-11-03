local opts = { noremap = true, silent = true }
local bufopts = { noremap = true, silent = true, buffer = 0 }

-- cmp capabilities
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lspconfig = require("lspconfig")
local function on_attach()
    vim.keymap.set("n", "[k", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "[j", vim.diagnostic.goto_next, opts)

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)

    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)

    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)

    vim.keymap.set("n", "<leader>f", function()
        vim.lsp.buf.format({ async = true })
    end, bufopts)
end

--servers
lspconfig.pyright.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

lspconfig.lua_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

lspconfig.svelte.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

-- lspconfig.ts_lsp.setup({
--     on_attach = on_attach,
--     capabilities = capabilities,
-- })

lspconfig.julials.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

lspconfig.tailwindcss.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

lspconfig.gopls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

lspconfig.clangd.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        clangd = {
            inlayHints = { enabled = false },
        },
    },
    -- cmd = { "clangd", "-isystem", "/usr/include/python3.11" },
})

lspconfig.rust_analyzer.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        ["rust-analyzer"] = {
            diagnostics = {
                enable = false,
            },
        },
    },
})

lspconfig.asm_lsp.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

lspconfig.r_language_server.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})
lspconfig.marksman.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

-- lspconfig.jdtls.setup({
--     on_attach = on_attach,
--     capabilities = capabilities,
-- })

return {
    on_attach = on_attach,
    capabilities = capabilities,
}
