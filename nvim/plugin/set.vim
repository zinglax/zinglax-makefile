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

" CURSOR LINE
set cursorline
hi CursorLine ctermbg=7 ctermfg=0

" CURSOR COLUMN
set cursorcolumn
hi CursorColumn ctermbg=7 ctermfg=0

" Tabs ( Stop it please. )
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab

" HTML to JavaScript String (and back again) from the spa book
vmap <silent> ;h :s?^\(\s*\)+ '\([^']\+\)',*\s*$?\1\2?g<CR>
vmap <silent> ;q :s?^\(\s*\)\(.*\)\s*$? \1 + '\2'?<CR>

" HTML to JavaScript template literal (and back again) from the spa book
vmap <silent> ;a :s?^\(\s*\)+ `\([^`]\+\)`,*\s*$?\1\2?g<CR>
vmap <silent> ;s :s?^\(\s*\)\(.*\)\s*$? \1 + `\2`?<CR>


