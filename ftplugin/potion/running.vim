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
  echom bytecode

  " Open a new split and set it up.

  " Insert the bytecode.

endfunc

nnoremap <buffer> <localleader>r :call PotionCompileAndRunFile()<cr>
nnoremap <buffer> <localleader>b :call PotionShowBytecode()<cr>
