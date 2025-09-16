"##############################################################################
"vim
"##############################################################################
nnoremap <C-s> :w<CR>
inoremap <C-s> <C-o>:w<CR>
inoremap <C-l> <End>


"##############################################################################
"ddc and source
"##############################################################################
"function s:TAB_complete_or_jump() abort
"    if vsnip#available(1)
"        return "\<Plug>(vsnip-expand-or-jump)"
"    elseif pum#visible()
"        return "\<Cmd>call pum#map#confirm()\<CR>"
"    else
"        return "\<Tab>"
"    endif
"endfunction

function s:TAB_complete_or_jump() abort
    if pum#visible()
        if vsnip#expandable()
            return "\<Plug>(vsnip-expand)"
        else
            return "\<Cmd>call pum#map#confirm()\<CR>"
        endif
    elseif vsnip#jumpable(1)
        return "\<Plug>(vsnip-jump-next)"
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
"inoremap <S-Tab> <Cmd>call pum#map#cancel()<CR>
"inoremap <silent><expr> <C-n> pum#visible() ?
"    \   '<Cmd>call pum#map#insert_relative(+1)<CR>' : ''
"inoremap <silent><expr> <C-p> pum#visible() ?
"    \   '<Cmd>call pum#map#insert_relative(-1)<CR>' : ''
imap <C-n>   <Cmd>call pum#map#insert_relative(+1)<CR>
imap <C-p>   <Cmd>call pum#map#insert_relative(-1)<CR>
imap <C-y>   <Cmd>call pum#map#confirm()<CR>
imap <C-e>   <Cmd>call pum#map#cancel()<CR>
"imap <PageDown> <Cmd>call pum#map#insert_relative_page(+1)<CR>
"imap <PageUp>   <Cmd>call pum#map#insert_relative_page(-1)<CR>
"imap <PageDown> <Cmd>call pum#map#scroll_preview(-1)<CR>
"imap <PageUp> <Cmd>call pum#map#scroll_preview(+1)<CR>

"vim-lsp
imap <expr><PageDown> lsp#scroll(+4)
imap <expr><PageUp> lsp#scroll(-4)
nmap <expr><PageDown> lsp#scroll(+4)
nmap <expr><PageUp> lsp#scroll(-4)

"vsnip
imap <silent><expr><TAB> <SID>TAB_complete_or_jump()
smap <silent><expr><TAB> <SID>TAB_complete_or_jump()
imap <silent><expr><S-TAB> <SID>S_TAB_complete_or_jump()
smap <silent><expr><S-TAB> <SID>S_TAB_complete_or_jump()

"copilot
imap <silent><script><expr> <C-f> copilot#Accept("\<CR>")


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
"Vim LSP
"##############################################################################
nmap <C-h>  <plug>(lsp-hover)
nmap <F2> <plug>(lsp-rename)
nmap <F3> <plug>(lsp-peek-definition)
nmap <F4> <plug>(lsp-references)


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
