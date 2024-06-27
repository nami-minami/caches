" hook_source {{{
call ddc#custom#patch_global('ui', 'native')
call ddc#custom#patch_global('sources', ['skkeleton', 'vsnip', 'lsp', 'shell-native', 'file', 'around'])
call ddc#custom#patch_global('sourceOptions', {
\   '_': {
\   'matchers': ['matcher_head'],
\   'sorters': [],
\   'converters': ['converter_remove_overlap'],
\   'minAutoCompleteLength': 2,
\   'dup': v:true
\   },
\   'around': {
\       'mark': 'around'
\   },
\   'lsp': {
\       'mark': 'lsp',
\       'forceCompletionPattern': '\.\w*|:\w*|->\w*',     
\       'sorters': ['sorter_lsp-kind'],
\       'converters': ['converter_kind_labels']
\   },
\   'vsnip': {
\       'mark': 'vsnip'
\   },
\   'file': {
\       'mark': 'file',
\       'isVolatile': v:true,
\       'forceCompletionPattern': '\S/\S*'
\   },
\   'shell-native': {
\       'mark': 'shell'
\   },
\   'skkeleton': {
\       'mark': 'skk',
\       'matchers': [],
\       'sorters': [],
\       'converters': [],
\       'isVolatile': v:true,
\       'minAutoCompleteLength': 1
\   }
\})

call ddc#custom#patch_global('sourceParams', #{
\   lsp: #{
\       lspEngine: 'vim-lsp',
\       enableAdditionalTextEdit: v:true,
\       snippetEngine: denops#callback#register({
\           body -> vsnip#anonymous(body)
\       })
\   },
\   shell-native: #{
\       shell: 'zsh'
\   }      
\})

function s:TAB_complete_expand_jump() abort
    if pumvisible()
        return "\<C-y>"
    elseif vsnip#jumpable()
        return "\<Plug>(vsnip-jump-next)"
    else
        return "\<TAB>"
    endif
    
endfunction

"ui-native
inoremap <silent><expr><C-n> pumvisible() ? '<C-n>' : ddc#map#manual_complete()
inoremap <silent><expr><C-p> pumvisible() ? '<C-p>' : ddc#map#manual_complete()

"vsnip
imap <silent><expr><TAB> <SID>TAB_complete_expand_jump()
smap <silent><expr><TAB> <SID>TAB_complete_expand_jump()

"skk
imap <C-j> <Plug>(skkeleton-enable)
cmap <C-j> <Plug>(skkeleton-enable)

call ddc#enable()
" }}}
