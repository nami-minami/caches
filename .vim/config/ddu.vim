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
    \       'file': {
    \           'columns': ['icon_filename'],
    \           'sorters': ['sorter_alpha'],
    \       },
    \   },
    \   'kindOptions': {
    \       '_': {
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
    \   'actionOptions': {
    \       'open': {
    \           'quit': v:false,
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
    \       {
    \           'name': 'rg',
    \           'options': {
    \               'mathers': [],
    \               'volatile': v:true,
    \           },
    \       },
    \   ],
    \   'sourceParams': {
    \       'rg': {
    \           'args': ['--json', '--hidden'],
    \       },
    \   },
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
    \       '_': {
    \           'displaySourceName': 'long',
    \       },
    \       'ff': {
    \           'split': 'horizontal',
    \           'ignoreEmpty': v:false,
    \           'autoResize': v:false,
    \       },
    \   },
    \})

function! s:ddu_filer_mappings() abort
    nmap <buffer><silent><expr> <CR>
        \   ddu#ui#get_item()->get('isTree', v:false) ?
        \       "<Cmd>call ddu#ui#do_action('expandItem',
        \           #{
        \               mode:
        \                   'toggle'
        \           }
        \       )<CR>" :
        \       "<Cmd>call ddu#ui#do_action('itemAction',
        \           #{
        \               name:'open',
        \                   params: #{
        \                       command: 'wincmd p <Bar> drop'
        \                   }
        \           }
        \       )<CR>"

    nmap <buffer><silent> V
        \   <Cmd>call ddu#ui#do_action('itemAction',
        \       #{
        \           name: 'open',
        \               params: #{
        \                   command: 'vnew <Bar> wincmd L <Bar> drop'
        \               }
        \       }
        \   )<CR>

    nmap <buffer><silent> <Space>
        \   <Cmd>call ddu#ui#do_action('toggleSelectItem')<CR>

    nmap <buffer><silent> i
        \   <Cmd>call ddu#ui#do_action('openFilterWindow')<CR>

    nmap <buffer><silent> q
        \   <Cmd>call ddu#ui#do_action('quit')<CR>
endfunction

function! s:ddu_ff_mappings() abort
    nmap <buffer><silent> <CR>
        \   <Cmd>call ddu#ui#do_action('itemAction')<CR>
    nmap <buffer><silent> <Space>
        \   <Cmd>call ddu#ui#do_action('toggleSelectItem')<CR>
    nmap <buffer><silent> i
        \   <Cmd>call ddu#ui#do_action('openFilterWindow')<CR>
    nmap <buffer><silent> q
        \   <Cmd>call ddu#ui#do_action('quit')<CR>
endfunction


augroup DduFilerOnDir
    autocmd!
    autocmd VimEnter * if isdirectory(expand('%:p')) |
        \   call ddu#start({'name':'filer'}) |
        \   endif
augroup END

autocmd FileType ddu-filer call s:ddu_filer_mappings()
autocmd FileType ddu-ff call s:ddu_ff_mappings()


command! Filer call ddu#start({ 'name': 'filer' })

nmap <silent> <C-f> <Cmd>call ddu#start({'name':'ff'})<CR>

"}}}
