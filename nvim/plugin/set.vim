" Auto Reload file
set autoread

" Wildcard Tabbing out Files in menus
set path+=**
set wildmenu
set wildignore+=**/node_modules/**
set wildignore+=**/docs/**
set hidden
set wim=longest:full,full 

" No swap 
set noswapfile

" LINE NUMBERS
set nu

" Tabs ( Stop it please. )
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab

" Paste Toggle
" Tap this button when you wanna paste something into the vim editor
set pastetoggle=<F3>

" Folding 
" based on indentation level, create folds (perfect for python being
" whitespace delimited, make sure to write json files with indentation as
" well)
set foldmethod=indent


" No Gui Cursor
set guicursor=

" CURSOR LINE
set cursorline
" hi CursorLine ctermbg=7 ctermfg=0

" CURSOR COLUMN
set cursorcolumn
hi CursorColumn term=bold cterm=bold
" hi CursorColumn ctermbg=7 ctermfg=0
" hi CursorColumn ctermbg=7 ctermfg=0

" THEME
color koehler
" color wal
" color darkblue

" CURSOR COLUMN NO UNDERLINE DECORATION.
hi CursorColumn term=bold cterm=bold

" ColorColumn (cc)
set colorcolumn=80
hi! link ColorColumn CursorColumn

" Pmenu Colors
hi! link Pmenu airline_c
hi! link PmenuSel airline_a_bold
hi! link PmenuThumb airline_warning_inactive
hi! link PmenuSbar airline_b

" Tabs ( Stop it please. )
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" No Highlight Search
set nohlsearch

" Spliting Windows.
" set splitright " splits to the right
" set splitbelow " splits below

" Search
set ignorecase " search case insensitive
set smartcase " search via smartcase
set incsearch " search incremental

" Clipboard
set clipboard=unnamedplus

" Setting the global python for neovim. 
let g:python3_host_prog = '/usr/bin/python3'

