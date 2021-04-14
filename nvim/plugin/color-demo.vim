
" Displays all of the cterm colors in a list
function s:ColorDemo()
    let num = 255
    while num >= 0
        exec 'hi col_'.num.' ctermbg='.num.' ctermfg=white'
        exec 'syn match col_'.num.' "ctermbg='.num.':...." containedIn=ALL'
        call append(0, 'ctermbg='.num.':....')
        let num = num - 1
    endwhile
endfunction
command! ColorDemo call s:ColorDemo()
nnoremap <silent> <Plug>ColorDemo :<C-u>ColorDemo<CR>

" ColorTest Displays all of the colors currently set and their groups
command! ColorTest :so $VIMRUNTIME/syntax/hitest.vim
" nnoremap <silent> <Plug>ColorTest :<C-u>ColorTest<CR>
