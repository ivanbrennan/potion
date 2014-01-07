if exists("b:current_syntax")
  finish
endif

syntax keyword potionKeyword loop times to while
syntax keyword potionKeyword if elsif else
syntax keyword potionKeyword class return
syntax keyword potionFunction print join string
syntax match potionComment "\v#.*$"

highlight link potionKeyword Keyword
highlight link potionFunction Function
highlight link potionComment Comment

let b:current_syntax = "potion"
