"##############################################################################
"vim
"##############################################################################
nnoremap <C-s> :w<CR>
inoremap <C-s> <C-o>:w<CR>
inoremap <C-l> <End>


"##############################################################################
"ddc and source
"##############################################################################
function s:TAB_complete_or_jump() abort
    "if pum#visible()
    "    if vsnip#available(1)
    "        return "\<Plug>(vsnip-expand-or-jump)"
    "    else
    "        return "\<Cmd>call pum#map#confirm()\<CR>"
    "    endif
    "else
    "    return "\<TAB>"
    "endif

    if vsnip#available(1)
        return "\<Plug>(vsnip-expand-or-jump)"
    elseif pum#visible()
        return "\<Cmd>call pum#map#confirm()\<CR>"
    else
        return "\<Tab>"
    endif
endfunction

function s:S_TAB_complete_or_jump() abort
    if pum#visible()
        return "\<Cmd>call pum#map#cancel()\<CR>"
    elseif vsnip#jumpable(-1)
        return "\<Plug>(vsnip-jump-prev)"
    else
        return "\<S-TAB>"
    endif
endfunction

"ui-pum
inoremap <S-Tab> <Cmd>call pum#map#cancel()<CR>
inoremap <silent><expr> <C-n> pum#visible() ?
    \   '<Cmd>call pum#map#insert_relative(+1)<CR>' : ''
inoremap <silent><expr> <C-p> pum#visible() ?
    \   '<Cmd>call pum#map#insert_relative(-1)<CR>' : ''


"vsnip
imap <silent><expr><TAB> <SID>TAB_complete_or_jump()
smap <silent><expr><TAB> <SID>TAB_complete_or_jump()
imap <silent><expr><S-TAB> <SID>S_TAB_complete_or_jump()
smap <silent><expr><S-TAB> <SID>S_TAB_complete_or_jump()


"skk
imap <C-j> <Plug>(skkeleton-enable)
cmap <C-j> <Plug>(skkeleton-enable)

"imap <C-n> <Plug>(henkanForward)
"cmap <C-n> <Plug>(henkanForward)
"imap <C-p> <Plug>(henkanBackward)
"cmap <C-p> <Plug>(henkanBackward)
"
"imap <TAB> <plug>(henkanInput)
"cmap <TAB> <plug>(henkanInput)


"##############################################################################
"solarized
"##############################################################################
function s:Togglebg() abort
    if &background == 'dark'
        set background=light
    elseif &background == 'light'
        set background=dark
    else
        return
    endif

    syntax enable
    colorscheme solarized
    highlight! link SignColumn Normal
endfunction

nmap <silent><expr><F12> <SID>Togglebg()
imap <silent><expr><F12> <SID>Togglebg()<BS>
