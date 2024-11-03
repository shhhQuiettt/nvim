vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = "*.py",
    command = "set filetype=python",
})
