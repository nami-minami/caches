" hook_source {{{
call ddu#custom#patch_local('filer', {
    \   'ui': 'filer',
    \   'sources': [
    \       {
    \           'name': 'file',
    \           'params': {},
    \       },
    \   ],
    \   'sourceOptions': {
    \       '_': {
    \           'columns': ['filename'],
    \       },
    \   },
    \   'kindOptions': {
    \       'file': {
    \           'defaultAction': 'open',
    \       },
    \   },
    \   'uiParams': {
    \       'filer': {
    \           'winWidth': 40,
    \           'split': 'vertical',
    \           'splitDirection': 'topleft',
    \       },
    \   },
    \})

call ddu#custom#patch_local('ff', {
    \   'ui': 'ff',
    \   'sources': [
    \       {
    \           'name': 'file_rec',
    \           'params': {},
    \       },
    \   ],
    \   'sourceOptions': {
    \       '_': {
    \           'matchers': [
    \               'matcher_substring'
    \           ],
    \       },
    \   },
    \   'kindOptions': {
    \       'file': {
    \           'defaultAction': 'open',
    \       },
    \   },
    \   'uiParams': {
    \       'ff': {
    \           'split': 'tab',
    \       },
    \   },
    \})

augroup DduFilerOnDir
    autocmd!
    autocmd VimEnter * if isdirectory(expand('%:p')) |
        \   call ddu#start({'name':'filer'}) |
        \   endif
augroup END

command! Filer call ddu#start({ 'name': 'filer' })

nmap <silent> <C-f> <Cmd>call ddu#start({'name':'ff'})<CR>
"}}}
