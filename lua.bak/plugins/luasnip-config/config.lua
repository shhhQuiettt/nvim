local luasnip = require "luasnip"
local types = require "luasnip.util.types"
local s = luasnip.s
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep
local i = luasnip.insert_node

vim.keymap.set("n", "<leader-s>", "<cmd>source ~/.config/nvim/lua/plugins/luasnip-config/config.lua<CR>")

luasnip.config.set_config {
    history = true,
    updateevents = "TextChanged,TextChangedI",
}

--mappings
vim.keymap.set({ "i", "s" }, "<c-l>", function()
    if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
    end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-h>", function()
    if luasnip.jumpable(-1) then
        luasnip.jump(-1)
    end
end, { silent = true })



require("luasnip.loaders.from_vscode").load()


-- luasnip.snippets = {
--     all = {
--         s("exp", fmt("local {} = require('{}')",{ i(1), rep(1)} ))
--     },

--     lua = {}
-- }
