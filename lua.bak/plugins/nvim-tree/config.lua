local nvim_tree = require("nvim-tree")

vim.api.nvim_set_keymap("n", "<C-b>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- nvim_tree.setup({
--     disable_netrw = true,
--     view = {
--         mappings = {
--             list = {
--                 { key = "<leader>rn", action = "rename" },
--                 { key = "p",          action = "dir_up" },
--                 { key = "r",          action = "refresh" },
--             },
--         },
--     },
-- })
--
local function on_attach(bufnr)
    local api = require("nvim-tree.api")

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- Default mappings. Feel free to modify or remove as you wish.
    --
    -- BEGIN_DEFAULT_ON_ATTACH
    vim.keymap.set("n", "<C-]>", api.tree.change_root_to_node, opts("CD"))
    vim.keymap.set("n", "<C-e>", api.node.open.replace_tree_buffer, opts("Open: In Place"))
    vim.keymap.set("n", "<C-k>", api.node.show_info_popup, opts("Info"))
    vim.keymap.set("n", "<C-r>", api.fs.rename_sub, opts("Rename: Omit Filename"))
    vim.keymap.set("n", "<C-t>", api.node.open.tab, opts("Open: New Tab"))
    vim.keymap.set("n", "<C-v>", api.node.open.vertical, opts("Open: Vertical Split"))
    vim.keymap.set("n", "<C-x>", api.node.open.horizontal, opts("Open: Horizontal Split"))
    vim.keymap.set("n", "<BS>", api.node.navigate.parent_close, opts("Close Directory"))
    vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
    vim.keymap.set("n", "<Tab>", api.node.open.preview, opts("Open Preview"))
    vim.keymap.set("n", ">", api.node.navigate.sibling.next, opts("Next Sibling"))
    vim.keymap.set("n", "<", api.node.navigate.sibling.prev, opts("Previous Sibling"))
    vim.keymap.set("n", ".", api.node.run.cmd, opts("Run Command"))
    vim.keymap.set("n", "-", api.tree.change_root_to_parent, opts("up"))
    vim.keymap.set("n", "a", api.fs.create, opts("create"))
    vim.keymap.set("n", "bmv", api.marks.bulk.move, opts("move bookmarked"))
    vim.keymap.set("n", "b", api.tree.toggle_no_buffer_filter, opts("toggle no buffer"))
    vim.keymap.set("n", "c", api.fs.copy.node, opts("copy"))
    vim.keymap.set("n", "c", api.tree.toggle_git_clean_filter, opts("toggle git clean"))
    vim.keymap.set("n", "[c", api.node.navigate.git.prev, opts("prev git"))
    vim.keymap.set("n", "]c", api.node.navigate.git.next, opts("next git"))
    vim.keymap.set("n", "d", api.fs.remove, opts("delete"))
    vim.keymap.set("n", "d", api.fs.trash, opts("trash"))
    vim.keymap.set("n", "e", api.tree.expand_all, opts("expand all"))
    vim.keymap.set("n", "e", api.fs.rename_basename, opts("rename: basename"))
    vim.keymap.set("n", "]e", api.node.navigate.diagnostics.next, opts("next diagnostic"))
    vim.keymap.set("n", "[e", api.node.navigate.diagnostics.prev, opts("prev diagnostic"))
    vim.keymap.set("n", "f", api.live_filter.clear, opts("clean filter"))
    vim.keymap.set("n", "f", api.live_filter.start, opts("filter"))
    vim.keymap.set("n", "g?", api.tree.toggle_help, opts("help"))
    vim.keymap.set("n", "gy", api.fs.copy.absolute_path, opts("copy absolute path"))
    vim.keymap.set("n", "h", api.tree.toggle_hidden_filter, opts("toggle dotfiles"))
    vim.keymap.set("n", "i", api.tree.toggle_gitignore_filter, opts("toggle git ignore"))
    -- vim.keymap.set("n", "j", api.node.navigate.sibling.last, opts("last sibling"))
    -- vim.keymap.set("n", "k", api.node.navigate.sibling.first, opts("first sibling"))
    vim.keymap.set("n", "m", api.marks.toggle, opts("toggle bookmark"))
    vim.keymap.set("n", "o", api.node.open.edit, opts("open"))
    vim.keymap.set("n", "o", api.node.open.no_window_picker, opts("open: no window picker"))
    vim.keymap.set("n", "p", api.fs.paste, opts("paste"))
    vim.keymap.set("n", "p", api.node.navigate.parent, opts("parent directory"))
    vim.keymap.set("n", "q", api.tree.close, opts("close"))
    vim.keymap.set("n", "r", api.tree.reload, opts("refresh"))
    vim.keymap.set("n", "s", api.node.run.system, opts("run system"))
    vim.keymap.set("n", "s", api.tree.search_node, opts("search"))
    vim.keymap.set("n", "u", api.tree.toggle_custom_filter, opts("toggle hidden"))
    vim.keymap.set("n", "w", api.tree.collapse_all, opts("collapse"))
    vim.keymap.set("n", "x", api.fs.cut, opts("cut"))
    vim.keymap.set("n", "y", api.fs.copy.filename, opts("copy name"))
    vim.keymap.set("n", "y", api.fs.copy.relative_path, opts("copy relative path"))
    vim.keymap.set("n", "<2-leftmouse>", api.node.open.edit, opts("open"))
    vim.keymap.set("n", "<2-rightmouse>", api.tree.change_root_to_node, opts("CD"))
    -- END_DEFAULT_ON_ATTACH

    vim.keymap.set("n", "<leader>rn", api.fs.rename, opts("Rename"))
    vim.keymap.set("n", "p", api.tree.change_root_to_parent, opts("Up"))
end

nvim_tree.setup({ on_attach = on_attach })
