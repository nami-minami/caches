" hook_source {{{
call ddc#custom#patch_global(#{
    \   ui: 'pum',
    \   sources: [
    \       'skkeleton',
    \       'vsnip',
    \       'lsp',
    \       'shell-native',
    \       'file',
    \       'around',
    \   ],
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

call ddc#enable()
" }}}
