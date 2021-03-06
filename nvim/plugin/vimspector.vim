" ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' '
" puremourning/vimspector

" Jump to specific Window.
fun! GotoWindow(id)
  :call win_gotoid(a:id)
endfun

" Add Expression to Watch List! 
func! AddToWatch()
  let word = expand("<cexpr>")
  call vimspector#AddWatch(word)
endfunction

" Vimspector Config.
let g:vimspector_base_dir = expand('$HOME/.config/vimspector-config')
let g:vimspector_sidebar_width = 60

" Window Navigation
nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
nnoremap <leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
nnoremap <leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>

" Step Over, Step Into, Step Out.
nnoremap <S-j> :call vimspector#StepOver()<CR>
nnoremap <S-k> :call vimspector#StepInto()<CR>
nnoremap <S-l> :call vimspector#StepOut()<CR>

" Execution
nnoremap <leader>da :call vimspector#Launch()<CR>
nnoremap <leader>dx :call vimspector#Reset()<CR>
nnoremap <leader>d_ :call vimspector#Restart()<CR>
nnoremap <leader>dn :call vimspector#Continue()<CR>
nnoremap <leader>drc :call vimspector#RunToCursor()<CR>
nnoremap <leader>dj :call vimspector#RunToCursor()<CR>

" Breakpoints
nnoremap <leader>dh :call vimspector#ToggleBreakpoint()<CR>
nnoremap <leader>de :call vimspector#ToggleConditionalBreakpoint()<CR>
nnoremap <leader>dX :call vimspector#ClearBreakpoints()<CR>

" Special
nnoremap <leader>d? :call AddToWatch()<CR>

let g:vimspector_sign_priority = {
      \    'vimspectorBP':         998,
      \    'vimspectorBPCond':     997,
      \    'vimspectorBPDisabled': 996,
      \    'vimspectorPC':         999,
      \ }

" Install the Debugger Gadget Manually
" :VimInspectorInstall vscode-node-debug2

" Manually create a .viminspector.json file in your project's directory or see
" video to in stall one globally.
" https://youtu.be/-AZUIL1rY3U?t=145
" ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' '




