if exists("b:current_syntax")
  finish
endif

syn keyword basicLanguageKeywords if then else when as is dbg expect expect-fx crash 
highlight link basicLanguageKeywords Statement

syntax match rocOperator "\v\=="
syntax match rocOperator "\v\+"
" Matches a minus as long as its not followed by a >

syntax match rocOperator "\v-(\>)@!"
highlight link rocOperator Operator
" Match any digit as long as its not preced by \a which is [a-zA-Z]
syn match rocNumber "\a\@<!\d\+"
highlight link rocNumber Number


syn match rocString "\".*\""
highlight link rocString String

syntax match potionComment "\v#.*$"
highlight link potionComment Comment

" match parameters \ stuff ->
