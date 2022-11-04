set showmatch               " show matching 
set ignorecase              " case insensitive 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number relativenumber                  " add line numbers
" set wildmode=longest,list   " get bash-like tab completions
set cc=80                  " set an 80 column border for good coding style
set encoding=UTF-8
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
" set spell                 " enable spell check (may need to download language package)
set noswapfile            " disable creating swap file
set backupdir=~/.cache/vim " Directory to store backup files.
set updatetime=300 "how many ms vim wait until it triggers plugins (for coc)
"set signcolumn=yes????? coc

"save on ctrl-s
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>


"add line with enter
map  <Enter> o<Esc>
map  <S-Enter> O<Esc> " This deosnt work

" Use ctrl-[hjkl] to select the active split
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" Use ctr-t-l ctrl-t-b to navigate tabs
 map <C-t>h :tabl<CR>
" map <C-t>l :tabr<CR>
" map <C-t>k :tabp<CR>
" map <C-t>l :tabn<CR>


"run on f5 in python
autocmd Filetype python inoremap <buffer> <F5> <C-o>:update<Bar>execute '!python '.shellescape(@%, 1)<CR>
autocmd Filetype python nnoremap <buffer> <F5> <C-o>:update<Bar>execute '!python '.shellescape(@%, 1)<CR>

"run on f5 in go
autocmd Filetype go inoremap <buffer> <F5> <C-o>:update<Bar>execute '!go run '.shellescape(@%, 1)<CR>
autocmd Filetype go nnoremap <buffer> <F5> <C-o>:update<Bar>execute '!go run '.shellescape(@%, 1)<CR>

"run docker-compose up on  <Leader>dcu
" nnoremap   <silent>   <Leader>dcu :FloatermNew! --height=0.35 --width=1  --wintype=split --position=botright docker-compose up <CR>
nnoremap   <silent>   <Leader>dcu :FloatermNew! --height=0.35 --width=1 --wintype=split --position=botright docker-compose up<CR>
call plug#begin("~/.config/nvim/plugged")

 " Plugin Section
 Plug 'morhetz/gruvbox' "color scheme
 Plug 'tpope/vim-surround' " let you sourand objects
 Plug 'tpope/vim-commentary' "commenter
 Plug 'terryma/vim-multiple-cursors'   
 Plug 'preservim/nerdtree' "file tree
 Plug 'ryanoasis/vim-devicons' "icons for nerdtree
 Plug 'neoclide/coc.nvim', {'branch': 'release'} " InlelisensTogether with coc-pyright, coc-snippets, coc-prettier, coc-json, coc-go, coc-docker, coc-yaml
 Plug 'voldikss/vim-floaterm'
 Plug 'akinsho/toggleterm.nvim'
 Plug 'honza/vim-snippets'
 Plug 'junegunn/fzf'
 Plug 'junegunn/fzf.vim' " Maybe the_silver_searcer (Ag) has to be installed in system
 Plug 'psf/black', { 'branch': 'stable' }
 Plug 'tpope/vim-fugitive'
 Plug 'jiangmiao/auto-pairs'
 Plug 'frazrepo/vim-rainbow' " For brackets colorizer
 " Plug 'airblade/vim-rooter'
 " Plug 'mhinz/vim-startify'
 " Plug 'mxw/vim-jsx' "jsx higligting
  " Plug 'mg979/vim-visual-multi', {'branch': 'master't
call plug#end()

"clear search (to highlighting to disappear
nnoremap <Leader>cs :let@/=""<cr>

"Colors
colorscheme gruvbox
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/ncovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif


""NERDTree config
" Toggle nerdtree on ctrl - b
nnoremap <C-b> :NERDTreeToggle<CR> 
inoremap <C-b> <Esc>:NERDTreeToggle<CR> 

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" after a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif

""coc config
"Ctrl+Space popup window
inoremap <silent><expr> <c-space> coc#refresh()

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)

"
" imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Navigate hintbox with ctrl-j/k
inoremap <expr> <C-j> coc#pum#visible() ? coc#pum#next(1) : "\<C-j>"
inoremap <expr> <C-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-k>"

"Confirm option with tab
inoremap <expr> <tab> coc#pum#visible() ? coc#pum#confirm() : "\<tab>"

    
""coc-snippet

"Use <tab> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<tab>'

" Use <shift-tab> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<S-tab>'


" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)



function! CheckBackSpace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

""coc-go config
" 
" autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

""Terminal config
nnoremap   <silent>   <Leader>nt :execute ':FloatermNew! --height=0.35 --width=1 --wintype=split --position=botright cd '.getcwd()<CR>
tnoremap   <silent>   <Leader>nt    <C-\><C-n> :FloatermNew --height=0.35 --width=1 --wintype=split --position=botright<CR>
let g:floaterm_keymap_prev   = '<PageUp>'
let g:floaterm_keymap_next   = '<PageDown>'
let g:floaterm_keymap_toggle = '<Leader>t'
let g:floaterm_keymap_kill   = '<Leader>kt'

"excape terminal with ctlr-k
tnoremap <c-k> <C-\><C-n>:wincmd k<CR>



"fzf config

nnoremap <c-p> :Files<CR>

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, {'source': 'ag --hidden --ignore .git -g ""'}, <bang>0)
" " :Prettier command






command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument

""black conifg
"format on save
"!!!!!!!!!!!!!!!!!!!1 augroup black_on_save
"   autocmd!
"   autocmd BufWritePre *.py Black
" augroup end

""auto-pairs config
" let g:AutoPairsFlyMode = 1

""Django 
"Maps on django project templates
let g:last_relative_dir = ''
nnoremap \1 :call RelatedFile ("models.py")<cr>
nnoremap \2 :call RelatedFile ("views.py")<cr>
nnoremap \3 :call RelatedFile ("urls.py")<cr>
nnoremap \4 :call RelatedFile ("admin.py")<cr>
nnoremap \5 :call RelatedFile ("tests.py")<cr>
nnoremap \6 :call RelatedFile ( "templates/" )<cr>
nnoremap \7 :call RelatedFile ( "templatetags/" )<cr>
nnoremap \8 :call RelatedFile ( "management/" )<cr>
nnoremap \0 :e settings.py<cr>
nnoremap \9 :e urls.py<cr>

fun! RelatedFile(file)
    "This is to check that the directory looks djangoish
    if filereadable(expand("%:h"). '/models.py') || isdirectory(expand("%:h") . "/templatetags/")
        exec "edit %:h/" . a:file
        let g:last_relative_dir = expand("%:h") . '/'
        return ''
    endif
    if g:last_relative_dir != ''
        exec "edit " . g:last_relative_dir . a:file
        return ''
    endif
    echo "Cant determine where relative file is : " . a:file
    return ''
endfun

fun SetAppDir()
    if filereadable(expand("%:h"). '/models.py') || isdirectory(expand("%:h") . "/templatetags/")
        let g:last_relative_dir = expand("%:h") . '/'
        return ''
    endif
endfun
autocmd BufEnter *.py call SetAppDir()


"" vim-rainbow config
let g:rainbow_active = 1

"" : \sv Source $MYVIMRC
nnoremap <Leader>sv :source $MYVIMRC<CR>

"coc spell-checker
vmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)
