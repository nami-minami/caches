
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
"call ddc#custom#patch_global('sourceParams', #{
"\   lsp: #{
"\       lspEngine: 'vim-lsp',
"\       enableResolveItem: v:true,
"\       enableAdditionalTextEdit: v:true,
"\       snippetEngine: denops#callback#register({ body -> vsnip#anonymous(body) })
"\   },
"\   shell-native: #{
"\       shell: 'zsh'
"\   }      
"\})
"call ddc#custom#patch_global('sourceParams', #{
"\   lsp: #{
"\       lspengine: 'vim-lsp',
"\       enableAdditionalTextEdit: v:true,
"\       snippetEngine: denops#callback#register({ 
"\           body -> vsnip#anonymous(body) 
"\       }),
"\   },
"\   shell-native: #{
"\       shell: 'zsh'
"\   }      
"\})
call ddc#custom#patch_global('sourceParams', #{
\   lsp: #{
\       lspEngine: 'vim-lsp',
\       enableAdditionalTextEdit: v:true,
\       snippetEngine: denops#callback#register({
\           body -> vsnip#anonymous(body)
\       })
\   }
\})


""vim-vsnip
"    " Expand
"    imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<Plug>(skkeleton-enable)'
"    smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
"
"    " Expand or jump
"    inoremap <expr><silent><C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
"    snoremap <expr><silent><C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
"
"    " Jump forward or backward
    imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
    smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
    imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
    smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

"imap <C-j> <Plug>(skkeleton-enable)
"cmap <C-j> <Plug>(skkeleton-enable)

inoremap <silent><expr><TAB> pumvisible() ? '<C-n>' : '<TAB>'
inoremap <silent><expr><C-n> pumvisible() ? '<C-n>' : ddc#map#manual_complete()
inoremap <silent><expr><C-p> pumvisible() ? '<C-p>' : ddc#map#manual_complete()

call ddc#enable()
" }}}
