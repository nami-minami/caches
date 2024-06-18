
" hook_source {{{
call ddc#custom#patch_global('ui', 'native')
call ddc#custom#patch_global('sources', ['skkeleton', 'lsp', 'shell-native', 'file', 'around'])
call ddc#custom#patch_global('sourceOptions', {
\   '_': {
\   'matchers': ['matcher_head'],
\   'sorters': ['sorter_rank'],
\   'minAutoCompleteLength': 2
\   },
\   'around': {
\       'mark': 'around'
\   },
\   'lsp': {
\       'mark': 'LSP',
\       'forceCompletionPattern': '\.\w*|:\w*|->\w*',     
\       'sorters': ['sorter_lsp-kind']
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
\       enableResolveItem: v:true,
\       enableAdditionalTextEdit: v:true,
\       snippetEngine: denops#callback#register({ body -> vsnip#anonymous(body) })
\   },
\   shell-native: #{
\       shell: 'zsh'
\   }      
\})

inoremap <silent><expr><TAB> pumvisible() ? '<C-n>' : '<TAB>'
inoremap <silent><expr><C-n> pumvisible() ? '<C-n>' : ddc#map#manual_complete()
inoremap <silent><expr><C-p> pumvisible() ? '<C-p>' : ddc#map#manual_complete()

imap <C-j> <Plug>(skkeleton-enable)
cmap <C-j> <Plug>(skkeleton-enable)

call ddc#enable()
" }}}
