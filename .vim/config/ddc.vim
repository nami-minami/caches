" hook_source {{{
call ddc#custom#patch_global(#{
    \   ui: 'native',
    \   sources: ['skkeleton', 'vsnip', 'lsp', 'shell-native', 'file', 'around'],
    \   sourceOptions: #{
    \        _: #{
    \            matchers: ['matcher_head'],
    \            sorters: [],
    \            converters: ['converter_remove_overlap'],
    \            dup: 'keep'
    \           },
    \       around: #{
    \           mark: 'around'
    \       },
    \       lsp: #{
    \           mark: 'lsp',
    \           forceCompletionPattern: '\.\w*|:\w*|->\w*',     
    \           sorters: ['sorter_lsp-kind'],
    \           converters: ['converter_kind_labels']
    \       },
    \       vsnip: #{
    \           mark: 'vsnip'
    \       },
    \       file: #{
    \           mark: 'file',
    \           isVolatile: v:true,
    \           forceCompletionPattern: '\S/\S*'
    \       },
    \       shell-native: #{
    \           mark: 'shell'
    \       },
    \       skkeleton: #{
    \           mark: 'skk',
    \           matchers: [],
    \           sorters: [],
    \           converters: [],
    \           isVolatile: v:true,
    \           minAutoCompleteLength: 1
    \       }
    \   },
    \   sourceParams: #{
    \       lsp: #{
    \           lspEngine: 'vim-lsp',
    \           enableAdditionalTextEdit: v:true,
    \           snippetEngine: denops#callback#register({
    \               body -> vsnip#anonymous(body)
    \           })
    \       },
    \       shell-native: #{
    \           shell: 'zsh'
    \       }      
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

"imap <C-n> <Plug>(henkanForward)
"cmap <C-n> <Plug>(henkanForward)
"imap <C-p> <Plug>(henkanBackward)
"cmap <C-p> <Plug>(henkanBackward)
"
"imap <TAB> <plug>(henkanInput)
"cmap <TAB> <plug>(henkanInput)

call ddc#enable()
" }}}
