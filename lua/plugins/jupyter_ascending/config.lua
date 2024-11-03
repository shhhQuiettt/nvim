vim.g.jupyter_ascending_match_pattern = ".py"

vim.keymap.set("i", "<C-e>", "jupyter_ascending#execute()", { silent = true, expr = true })
vim.keymap.set("n", "<leader>rc", "jupyter_ascending#execute()", { silent = true, expr = true })
vim.keymap.set("n", "<leader>rac", "jupyter_ascending#execute_all()", { silent = true, expr = true })

function _G.new_jupyter_percent_cell()
    -- vim.api.nvim_command("insert! o# %% \n")
    -- mapping that creates a new line, types "# %%" and then goes to the next line to the insert mode
    vim.api.nvim_command("normal! o# %%\n")
    vim.api.nvim_command("startinsert")
end

vim.keymap.set("n", "<leader>nc", ":lua new_jupyter_percent_cell()<CR>")
