local builtin = require("telescope.builtin")
local telescope = require("telescope")

telescope.setup({
    defaults={
        mappings = {
            i = {
                ['<C-j>'] = "move_selection_next",
                ['<C-k>'] = "move_selection_previous",
            }
        }
    }
})

vim.keymap.set("n", "<C-p>", builtin.find_files)
vim.keymap.set("n",'<leader>d', builtin.diagnostics)

