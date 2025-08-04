" hook_source {{{
call ddc#custom#patch_global(#{
    \   ui: 'pum',
    \   sources: [
    \       'skkeleton',
    \       'vsnip',
    \       'lsp',
    \       'shell',
    \       'shell_native',
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
    \       copilot: #{
    \           mark: 'copilot',
    \           matchers: [],
    \           minAutoCompleteLength: 0
    \       },
    \       lsp: #{
    \           mark: 'lsp',
    \           isVolatile: v:true,
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
    \       shell_native: #{
    \           mark: 'zsh'
    \       },
    \       shell: #{
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
    \       copilot: #{
    \           copilot: 'vim'
    \       },
    \       lsp: #{
    \           lspEngine: 'vim-lsp',
    \           enableAdditionalTextEdit: v:true,
    \           snippetEngine: denops#callback#register({
    \               body -> vsnip#anonymous(body)
    \           })
    \       },
    \       shell_native: #{
    \           shell: 'zsh'
    \       }      
    \   }
    \})

call ddc#enable()
" }}}
