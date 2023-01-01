local g = vim.g
local o = vim.o

o.showmatch = true               -- show matching 

o.ignorecase = true              -- case insensitive 
o.hlsearch = true                -- highlight search 
o.incsearch = true               -- incremental search
o.tabstop = 4               -- number of columns occupied by a tab 
o.softtabstop=4           -- see multiple spaces as tabstops so <BS> does the right thing
o.expandtab = true               -- converts tabs to white space
o.shiftwidth = 4            -- width foor autoindents
o.autoindent = true              -- indent a new line the same amount as the line just typed
-- o.number  = "relativenumber"                  -- add line numbers
o.relativenumber  = true
-- set wildmode=longest,list   -- get bash-like tab completions
o.encoding="UTF-8"
-- o.filetype plugin indent on   --allow auto-indenting depending on file type
o.syntax  = "on"                   -- syntax highlighting

o.mouse="a"                 -- enable mouse click

o.clipboard = "unnamedplus"   -- using system clipboard
-- filetype plugin on
-- o.cursorline = true              -- highlight current cursorline
o.ttyfast = true                 -- Speed up scrolling inn Vim
o.noswap = true
-- set spell                 -- enable spell check (may need to download language package)
o.backupdir = "~/.cache/vim" -- Directory to store backup files.
o.updatetime=300 -- how many ms vim wait untill it triggers plugins (ffor coc)

o.signcolumn = "yes"
