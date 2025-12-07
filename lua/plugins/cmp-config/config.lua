local cmp = require("cmp")
-- local lspkind = require("lspkind") -- makes icons on hintbox
-- local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")

vim.opt.completeopt = { "menu", "menuone", "noselect" }

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping(function()
            if cmp.visible() then
                cmp.abort()
            else
                cmp.complete()
            end
        end, { "i", "s" }),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<Tab>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<M-l>"] = cmp.mapping(function(fallback)
            vim.api.nvim_feedkeys(
                vim.fn["copilot#Accept"](vim.api.nvim_replace_termcodes("<C-l>", true, true, true)),
                "n",
                true
            )
        end),
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "buffer",  keyword_length = 5 },
    }),
    -- formatting = {
    --     format = lspkind.cmp_format({
    --         mode = "symbol_text",
    --         menu = {
    --             buffer = "[Buf]",
    --             nvim_lsp = "[LSP]",
    --             path = "[Path]",
    --         },
    --     }),
    -- },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
})

