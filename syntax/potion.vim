if exists("b:current_syntax")
    finish
endif

syntax keyword potionKeyword loop times to while
syntax keyword potionKeyword if elsif else
syntax keyword potionKeyword class return
highlight link potionKeyword Keyword

syntax keyword potionFunction print join string
highlight link potionFunction Function

syntax match potionComment "\v#.*$"
highlight link potionComment Comment

syntax match potionOperator "\v\*"
syntax match potionOperator "\v/"
syntax match potionOperator "\v\+"
syntax match potionOperator "\v-"
syntax match potionOperator "\v\?"
syntax match potionOperator "\v\="
syntax match potionOperator "\v\*\="
syntax match potionOperator "\v/\="
syntax match potionOperator "\v\+\="
syntax match potionOperator "\v-\="
syntax match potionOperator "\v/[a-zA-Z_][0-9a-zA-Z_]*"
highlight link potionOperator Operator

syntax match potionNumber "\v(^|\s+)[-+]?[0-9]*\.?[0-9]+([eE][-+]?[0-9]+)?"
syntax match potionNumber "\v(^|\s+)0[xX][0-9a-fA-F]+"
highlight link potionNumber Number

syntax region potionString start=/\v"/ skip=/\v\\./ end=/\v"/
syntax region potionString start=/\v\'/ skip=/\v\\./ end=/\v\'/
highlight link potionString String

let b:current_syntax = "potion"
