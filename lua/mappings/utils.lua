
function ReloadConfig()
  for name,_ in pairs(package.loaded) do
    -- Optional: Only clear your own config modules (starts with 'user' or similar)
    -- if name:match('^user') then
      package.loaded[name] = nil
    -- end
  end

  dofile(vim.env.MYVIMRC)
  print("Reloaded Configuration")
end

-- Map it to a key (e.g., <Leader>r)
vim.keymap.set('n', '<leader>rc', '<cmd>lua ReloadConfig()<CR>')
