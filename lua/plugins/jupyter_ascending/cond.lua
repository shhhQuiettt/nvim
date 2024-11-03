return function()
    -- print all entries
    -- for _, entry in ipairs(entries) do
    --     print(entry)
    -- end
    -- for _, entry in ipairs(entries) do
    --     if entry.mode == "file" and entry.name:match("%.ipynb$") then
    --         return true
    --     end
    -- end
    --
    local entries = vim.fn.glob("*.ipynb")
    return #entries > 0
end
