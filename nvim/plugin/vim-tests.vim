
" janko/vim-test
nnoremap <silent> tt :TestNearest<CR>
nnoremap <silent> tf :TestFile<CR>
nnoremap <silent> ts :TestSuite<CR>
nnoremap <silent> t_ :TestLast<CR>
let test#strategy = "neovim"
let test#neovim#term_position = "vertical"



" ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' '
" Custom Strategies
function! MochaStrategy(cmd)
  let testName = matchlist(a:cmd, '\v -t ''(.*)''')[1]
  call vimspector#LaunchWithSettings( #{ configuration: 'mocha', TestName: testName } )
endfunction      

function! MochaStrategy2(cmd)
  let testName = matchlist(a:cmd, '\(.*\)mocha \(test.*\.test\.js\)')[2]
  let testCmd = a:cmd
  " echo testCmd
  echo testName
  call vimspector#LaunchWithSettings( #{ configuration: 'mocha2', Command: testCmd, TestName: testName } )
endfunction      


function! EchoStrategy(cmd)
  echo 'It works! Command for running tests: ' . a:cmd
endfunction

function! PytestStrategy(cmd)
  echo 'Full Command: ' . a:cmd
  let testName = matchlist(a:cmd, 'pytest \(.*\)')[1]
  " let testName = a:cmd
  echo testName
  call vimspector#LaunchWithSettings( #{ configuration: 'Pytest: Launch', TestName: testName } )
endfunction


let g:test#custom_strategies = {
      \ 'echo': function('EchoStrategy'), 
      \ 'mocha': function('MochaStrategy'),
      \ 'mocha2': function('MochaStrategy2'),
      \ 'pytest': function('PytestStrategy'),
      \ }

" let g:test#strategy = 'echo'



nnoremap <leader>dd :TestNearest -strategy=echo<CR>
nnoremap <leader>dp :TestNearest -strategy=pytest<CR>
nnoremap <leader>dm :TestNearest -strategy=mocha2<CR>



" ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' '
