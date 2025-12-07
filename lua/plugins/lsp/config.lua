local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
  callback = function(args)
    -- args.buf contains the buffer number where the LSP attached
    local bufnr = args.buf
    local opts = { buffer = bufnr, silent = true }

    vim.keymap.set("n", "[k", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "[j", vim.diagnostic.goto_next, opts)

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)

    -- 3. Information & Actions
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

    -- 4. Formatting
    vim.keymap.set("n", "<leader>f", function()
        vim.lsp.buf.format({ async = true })
    end, opts)
  end,
})

---- cmp capabilities

------ PYTHON -------
vim.lsp.config.ty = {
    capabilities = capabilities,
}

vim.lsp.enable("ty")

vim.lsp.config.ruff = {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        client.server_capabilities.hoverProvider = false
    end,
}

vim.lsp.enable("ruff")

------- LUA --------
vim.lsp.config.lua_ls = {
    capabilities = capabilities,
}
vim.lsp.enable("lua_ls")

------- GO --------
vim.lsp.enable("gopls")

------- C/C++ --------
vim.lsp.enable("clangd")


--
--local opts = { noremap = true, silent = true l
--local bufopts = { noremap = true, silent = true, buffer = 0 }

---- cmp capabilities
--local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- local lspconfig = require("lspconfig")
--local function on_attach()
--    vim.keymap.set("n", "[k", vim.diagnostic.goto_prev, opts)
--    vim.keymap.set("n", "[j", vim.diagnostic.goto_next, opts)

--    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
--    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, bufopts)
--    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)

--    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
--    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)

--    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)

--    vim.keymap.set("n", "<leader>f", function()
--        vim.lsp.buf.format({ async = true })
--    end, bufopts)
--end

----servers
--lspconfig.pyright.setup({
--    on_attach = on_attach,
--    capabilities = capabilities,
--})

--lspconfig.lua_ls.setup({
--    on_attach = on_attach,
--    capabilities = capabilities,
--})

--lspconfig.svelte.setup({
--    on_attach = on_attach,
--    capabilities = capabilities,
--})

---- lspconfig.ts_lsp.setup({
----     on_attach = on_attach,
----     capabilities = capabilities,
---- })

--lspconfig.julials.setup({
--    on_attach = on_attach,
--    capabilities = capabilities,
--})

--lspconfig.tailwindcss.setup({
--    on_attach = on_attach,
--    capabilities = capabilities,
--})

--lspconfig.gopls.setup({
--    on_attach = on_attach,
--    capabilities = capabilities,
--})

--lspconfig.clangd.setup({
--    on_attach = on_attach,
--    capabilities = capabilities,
--    settings = {
--        clangd = {
--            inlayHints = { enabled = false },
--        },
--    },
--    -- cmd = { "clangd", "-isystem", "/usr/include/python3.11" },
--})

--lspconfig.rust_analyzer.setup({
--    on_attach = on_attach,
--    capabilities = capabilities,
--    settings = {
--        ["rust-analyzer"] = {
--            diagnostics = {
--                enable = false,
--            },
--        },
--    },
--})

--lspconfig.asm_lsp.setup({
--    on_attach = on_attach,
--    capabilities = capabilities,
--})

--lspconfig.r_language_server.setup({
--    on_attach = on_attach,
--    capabilities = capabilities,
--})
---- lspconfig.marksman.setup({
----     on_attach = on_attach,
----     capabilities = capabilities,
---- })

--lspconfig.html.setup({
--    on_attach = on_attach,
--    capabilities = capabilities,
--})

---- lspconfig.jdtls.setup({
----     on_attach = on_attach,
----     capabilities = capabilities,
---- })

--return {
--    on_attach = on_attach,
--    capabilities = capabilities,
--}
