function! potion#running#PotionCompileAndRunFile()
  silent !clear
  execute "!" . g:potion_command . " " . bufname("%")
endfunc

function! potion#running#PotionShowBytecode()
  " Get the bytecode.
  let bytecode = system(g:potion_command . " -c -V " . bufname("%"))
  let bytewinnr = bufwinnr( "__Potion_Bytecode__" )

  if bytewinnr == -1
    " Open a new split and set it up.
    vsplit __Potion_Bytecode__
  else
    execute bytewinnr . "wincmd w"
  endif

  normal! ggdG
  setlocal filetype=potionbytecode
  setlocal buftype=nofile

  if v:shell_error == 0
    " Insert the bytecode.
    call append(0, split(bytecode, '\v\n'))
  else
    call append(0, "Error")
  endif
endfunc
