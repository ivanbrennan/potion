if !exists("g:potion_command")
  let g:potion_command = "potion"
endif

nnoremap <buffer> <localleader>r
      \ :w<cr>:call potion#running#PotionCompileAndRunFile()<cr>
nnoremap <buffer> <localleader>b
      \ :w<cr>:call potion#running#PotionShowBytecode()<cr>
nnoremap <buffer> <localleader>bb :echo potion#running#ivar<cr>
