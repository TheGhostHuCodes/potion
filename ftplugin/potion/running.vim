if !exists("g:potion_command")
    let g:potion_command = "potion"
endif

function! PotionCompileAndRunFile()
    write
    silent !clear
    execute "!" . g:potion_command . " " . bufname("%")
endfunction

function! PotionShowBytecode()
    write
    " Get the bytecode.
    let bytecode = system(g:potion_command . " -c -V " . bufname("%"))

    " Switch to or open split and set it up.
    let bytecodeWindow = bufwinnr("__Potion_Bytecode__")
    if bytecodeWindow < 0
        vsplit __Potion_Bytecode__
    else
        execute bytecodeWindow . "wincmd w"
    endif
    normal! ggdG
    setlocal filetype=potionbytecode
    setlocal buftype=nofile

    " Insert the bytecode.
    call append(0, split(bytecode, '\v\n'))
endfunction

nnoremap <buffer> <localleader>r :call PotionCompileAndRunFile()<cr>
nnoremap <buffer> <localleader>b :call PotionShowBytecode()<cr>
