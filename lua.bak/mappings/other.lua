local keymap = vim.keymap.set

-- Save on Ctrl-s
keymap("n", "<C-s>", ":update<CR>", { silent = false })
keymap("v", "<C-s>", "<C-C>:update<CR>", { silent = false })

keymap("i", "<C-s>", "<C-O>:update<CR>", { silent = false })

-- Add line with enter
keymap("n", "<Enter>", "o<Esc>")

-- \cs to clear search highliting

keymap("n", "<Leader>cs", ":noh<CR>", { silent = true })
