local builtin = require("telescope.builtin")
local telescope = require("telescope")

telescope.setup({
    defaults = {
        file_ignore_patterns = { ".git/", "node_modules/", "__pycache__/" },
        mappings = {
            i = {
                ["<C-j>"] = "move_selection_next",
                ["<C-k>"] = "move_selection_previous",
            },
        },
    },
    pickers = {
        find_files = {
            hidden = true,
        },
        diagnostics = {
            layout_config = {
                height = 0.9,
                width = 0.95,
                preview_width = 0.3,
            },
            line_width = 'full',
            wrap_results = true,
        },
    }
})

vim.keymap.set("n", "<C-p>", builtin.find_files)
vim.keymap.set("n", "<leader>ss", builtin.live_grep)
vim.keymap.set("n", "<leader>d", builtin.diagnostics)
vim.keymap.set("n", "gr", builtin.lsp_references)
vim.keymap.set("n", "<leader>gc", builtin.git_commits)
vim.keymap.set("n", "<leader>sm", builtin.treesitter)
