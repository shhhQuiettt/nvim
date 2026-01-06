require("nvim-treesitter.configs").setup({
    -- A list of parser names, or "all" (the five listed parsers should always be installed)
    --
    ensure_installed = { "javascript", "typescript", "rust", "c", "lua", "vim", "vimdoc", "java", "python", "cpp",
        "r", "markdown", "json", "rnoweb", "yaml", "toml", "html", "css", "bash", "dockerfile", "go", "gomod", "gosum",
        "gowork", "sql" },


    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    auto_install = true,

    highlight = {
        enable = true,         -- false will disable the whole extension
        additional_vim_regex_highlighting = false,
    },

    indent = {
        enable = true,
    },
})
