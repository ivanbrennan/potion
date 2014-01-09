if !exists("g:potion_command")
  let g:potion_command = "potion"
endif

function! PotionCompileAndRunFile()
  silent !clear
  execute "!" . g:potion_command . " " . bufname("%")
endfunc

function! PotionShowBytecode()
  " Get the bytecode.
  let bytecode = system(g:potion_command . " -c -V " . bufname("%"))
  let bytewinnr = bufwinnr( "__Potion_Bytecode__" )

  if bytewinnr == -1
    " Open a new split and set it up.
    vsplit __Potion_Bytecode__
  else
    bytewinnr wincmd w
  endif

  normal! ggdG
  setlocal filetype=potionbytecode
  setlocal buftype=nofile

  if v:shell_error == 0
    " Insert the bytecode.
    call append(0, split(bytecode, '\v\n'))
  else
    call append(0, "Error")
endfunc

nnoremap <buffer> <localleader>r :w<cr>:call PotionCompileAndRunFile()<cr>
nnoremap <buffer> <localleader>b :w<cr>:call PotionShowBytecode()<cr>
