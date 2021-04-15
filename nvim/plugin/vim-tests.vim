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
  let testName = matchlist(a:cmd, '\(.*\)mocha \(test.*\.test\.js\)')[2]

  try
    let testGrep = matchlist(a:cmd, '\(.*\)mocha \(test.*\.test\.js\) --grep \(.*\)')[3]
  catch /list index out of range/
    let testGrep = '.*'
  endtry

  call vimspector#LaunchWithSettings( #{ configuration: 'mocha2', TestGrep: testGrep, TestName: testName } )
endfunction      

function! EchoStrategy(cmd)
  echo 'echoing VIM-Test Command: ' . a:cmd
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
      \ 'mocha2': function('MochaStrategy'),
      \ 'pytest': function('PytestStrategy'),
      \ }

nnoremap <leader>dd :TestNearest -strategy=echo<CR>
nnoremap <leader>dp :TestNearest -strategy=pytest<CR>
nnoremap <leader>dm :TestNearest -strategy=mocha2<CR>
" ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' '
