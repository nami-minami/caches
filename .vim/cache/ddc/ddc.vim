" hook_source {{{
call ddc#custom#patch_global('ui', 'native')
call ddc#custom#patch_global('sources', ['vim-lsp', 'shell-native', 'file', 'around'])
call ddc#custom#patch_global('sourceOptions', {
\       '_': {
\       'matchers': ['matcher_head'],
\       'sorters': ['sorter_rank'],
\       'minAutoCompleteLength': 2
\       },
\       'around': {
\               'mark': 'around'
\       },
\       'vim-lsp': {
\               'mark': 's-lsp',
\               'forceCompletionPattern': '\.\w*|:\w*|->\w*',
\               'sorters': ['sorter_lsp-kind']
\       },
\       'file': {
\           'mark': '   file',
\           'isVolatile': v:true,
\           'forceCompletionPattern': '\S/\S*'
\       },
\       'shell-native': {
\           'mark': 'shell'
\       }
\})
call ddc#custom#patch_global('sourceParams', {
\   'shell-native': {
\       'shell': 'zsh'
\   }      
\      
\      
\})

inoremap <silent><expr><TAB> pumvisible() ? '<C-n>' : '<TAB>'
inoremap <silent><expr><C-n> pumvisible() ? '<C-n>' : ddc#map#manual_complete()
inoremap <silent><expr><C-p> pumvisible() ? '<C-p>' : ddc#map#manual_complete()

call ddc#enable()
" }}}
