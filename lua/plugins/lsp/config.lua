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
-- vim.lsp.config.ty = {
--     capabilities = capabilities,
-- }

-- vim.lsp.enable("ty")

-- vim.lsp.config.ruff = {
--     capabilities = capabilities,
--     on_attach = function(client, bufnr)
--         client.server_capabilities.hoverProvider = false
--     end,
-- }

-- vim.lsp.enable("ruff")
--
vim.lsp.config.pyright = {
    capabilities = capabilities,
}
vim.lsp.enable("pyright")

------- LUA --------
vim.lsp.config.lua_ls = {
    capabilities = capabilities,
}
vim.lsp.enable("lua_ls")

------- GO --------
vim.lsp.enable("gopls")

------- C/C++ --------
vim.lsp.enable("clangd")


