local builtin = require("telescope.builtin")
local telescope = require("telescope")

telescope.setup({
    defaults = {
        mappings = {
            i = {
                ["<C-j>"] = "move_selection_next",
                ["<C-k>"] = "move_selection_previous",
            },
        },
    },
})

vim.keymap.set("n", "<C-p>", builtin.find_files)
vim.keymap.set("n", "<leader>ss", builtin.grep_string)
vim.keymap.set("n", "<leader>d", builtin.diagnostics)
vim.keymap.set("n", "gr", builtin.lsp_references)
