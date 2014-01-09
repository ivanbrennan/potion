if !exists("g:potion_command")
  let g:potion_command = "potion"
endif

function! PotionCompileAndRunFile()
  silent !clear
  execute "!" . g:potion_command . " " . bufname("%")
endfunc

nnoremap <buffer> <localleader>r :call PotionCompileAndRunFile()<cr>
