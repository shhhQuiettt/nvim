local g = vim.g

g.floaterm_keymap_prev   = '<PageUp>'
g.floaterm_keymap_next   = '<PageDown>'
g.floaterm_keymap_new    = '<Leader>nt'
g.floaterm_keymap_toggle = '<Leader>t'
g.floaterm_keymap_kill   = '<Leader>kt'
g.floaterm_wintype       = "split"
g.floaterm_position      = "botright"
g.floaterm_height        = 0.35
g.floaterm_width         = 1

function _G.set_terminal_keymaps()
    local opts = {} -- {buffer = 0}
    vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
    vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
    vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
end

vim.cmd('autocmd! User FloatermOpen  lua set_terminal_keymaps()')
vim.keymap.set('t', '<esc>', [[<C-\><C-n>]])
vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]])
