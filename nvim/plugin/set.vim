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

" THEME
color koehler
" color wal

" No Gui Cursor
set guicursor=

" CURSOR LINE
set cursorline
hi CursorLine ctermbg=7 ctermfg=0

" CURSOR COLUMN
set cursorcolumn
hi CursorColumn ctermbg=7 ctermfg=0

" Tabs ( Stop it please. )
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" No Highlight Search
set nohlsearch

" Spliting Windows.
set splitright " splits to the right
set splitbelow " splits below

" Search
set ignorecase " search case insensitive
set smartcase " search via smartcase
set incsearch " search incremental
