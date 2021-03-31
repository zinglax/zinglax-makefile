" https://gist.github.com/fuadnafiz98/6cb7a4dea53d441dce2faa4d8da89893
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20
let g:NetrwIsOpen=0
function! s:ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i 
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lexplore
    endif
endfunction
command! ToggleNetrw call s:ToggleNetrw()
noremap <silent> <C-b> :call ToggleNetrw()<CR>
