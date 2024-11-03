vim.g.copilot_enabled = true
vim.g.copilot_filetypes = { xml = false }

vim.g.copilot_no_tab_map = true

-- vim.g.copilot_enabled = false

vim.keymap.set("i", "<M-l>", 'copilot#Accept("<M-l>")', { silent = true, expr = true })

vim.keymap.set(
    "i",
    "<Plug>(vimrc:copilot-dummy-map)",
    'copilot#Accept("")',
    { silent = true, expr = true, desc = "Copilot dummy accept" }
)

vim.cmd([[imap <M-k> <Plug>(copilot-previous)]])
vim.cmd([[imap <M-j> <Plug>(copilot-next)]])
vim.cmd([[imap <C-\> <Plug>(copilot-suggest)]])
