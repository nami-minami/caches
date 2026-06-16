function! ImeOff() abort
    let g:ime_mode = str2nr(trim(system('fcitx5-remote')))
    call system('fcitx5-remote -o')
endfunction

function! ImeOn() abort
    call system('fcitx5-remote -c')
endfunction

augroup ToggleIme
    autocmd!
    autocmd VimEnter * autocmd SafeStateAgain * ++once call ImeOff()
    autocmd FocusGained * call ImeOff()
    autocmd FocusLost,VimLeave * call ImeOn()
augroup END
