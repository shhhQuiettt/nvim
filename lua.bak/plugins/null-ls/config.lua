local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local cache_vars = {}
local function get_jdtls_paths()
    if cache_vars.paths then
        return cache_vars.paths
    end

    local path = {}

    path.data_dir = vim.fn.stdpath("cache") .. "/nvim-jdtls"

    local jdtls_install = require("mason-registry").get_package("jdtls"):get_install_path()

    path.java_agent = jdtls_install .. "/lombok.jar"
    path.launcher_jar = vim.fn.glob(jdtls_install .. "/plugins/org.eclipse.equinox.launcher_*.jar")

    if vim.fn.has("mac") == 1 then
        path.platform_config = jdtls_install .. "/config_mac"
    elseif vim.fn.has("unix") == 1 then
        path.platform_config = jdtls_install .. "/config_linux"
    elseif vim.fn.has("win32") == 1 then
        path.platform_config = jdtls_install .. "/config_win"
    end

    path.bundles = {}

    ---
    -- Include java-test bundle if present
    ---
    local java_test_path = require("mason-registry").get_package("java-test"):get_install_path()

    local java_test_bundle = vim.split(vim.fn.glob(java_test_path .. "/extension/server/*.jar"), "\n")

    if java_test_bundle[1] ~= "" then
        vim.list_extend(path.bundles, java_test_bundle)
    end

    ---
    -- Include java-debug-adapter bundle if present
    ---
    local java_debug_path = require("mason-registry").get_package("java-debug-adapter"):get_install_path()

    local java_debug_bundle =
        vim.split(vim.fn.glob(java_debug_path .. "/extension/server/com.microsoft.java.debug.plugin-*.jar"), "\n")

    if java_debug_bundle[1] ~= "" then
        vim.list_extend(path.bundles, java_debug_bundle)
    end

    ---
    -- Useful if you're starting jdtls with a Java version that's
    -- different from the one the project uses.
    ---
    path.runtimes = {
        -- Note: the field `name` must be a valid `ExecutionEnvironment`,
        -- you can find the list here:
        -- https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
        --
        -- This example assume you are using sdkman: https://sdkman.io
        -- {
        --   name = 'JavaSE-17',
        --   path = vim.fn.expand('~/.sdkman/candidates/java/17.0.6-tem'),
        -- },
        -- {
        --   name = 'JavaSE-18',
        --   path = vim.fn.expand('~/.sdkman/candidates/java/18.0.2-amzn'),
        -- },
    }

    cache_vars.paths = path

    return path
end

null_ls.setup({
    on_attach = function(client, bufnr)
        -- format on save
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                    vim.lsp.buf.format({ bufnr = bufnr })
                    -- vim.lsp.buf.formatting_sync()
                end,
            })
        end
    end,
    sources = {
        -- Python
        formatting.black,

        -- Lua
        formatting.stylua,

        -- JS
        formatting.prettier.with({ extra_args = { "--no-semi" } }),
        -- formatting.eslint,
        -- formatting.prettier,
        -- formatting.asmfmt,
        -- formatting.xmlformat,
    },
})
