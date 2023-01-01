-- Set up nvim-cmp.
local cmp = require 'cmp'
local lspkind = require 'lspkind' -- makes icons on hintbox
local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")


vim.opt.completeopt = { "menu", "menuone", "noselect" }

cmp.setup({
    snippet = {
        expand = function(args)
            -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
    },
    -- window = {
    --     -- completion = cmp.config.window.bordered(),
    --     -- documentation = cmp.config.window.bordered(),
    -- },

    mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping(function() if cmp.visible() then cmp.abort() else cmp.complete() end end
            , { "i", "s" }),
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<Tab>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ['<C-l>'] = cmp.mapping(
          function(fallback)
            cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
          end,
          { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
        ),
        ['<C-h>'] = cmp.mapping(
          function(fallback)
            cmp_ultisnips_mappings.jump_backwards(fallback)
          end,
          { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
        ),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'ultisnips' }, -- For ultisnips users.
        { name = 'path' },
        { name = 'buffer', keyword_length = 5 },
    }),

    formatting = {
        format = lspkind.cmp_format({
            mode = "symbol_text",
            menu = {
                buffer = "[Buf]",
                nvim_lsp = "[LSP]",
                nvim_lua = "[n_lua]",
                path = "[Path]",
                luasnip = "[Luasnip]",
                ultisnips = "[Ultisnips]",
                tn = "[TabNine]",
            },
        })
    }
})
