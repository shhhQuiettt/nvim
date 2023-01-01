local nvim_tree = require("nvim-tree")

vim.api.nvim_set_keymap("n", "<C-b>", ":NvimTreeToggle<CR>", {noremap = true, silent=true})

nvim_tree.setup({
      disable_netrw = true,
      view= {
        mappings= {
            list = {
                {key="<leader>rn", action="rename"},
                {key="p", action="dir_up"},
                {key="r", action="refresh"},

            }
        }
      },
})
