function s:dppInitPlugin(plugin)
    let dir = $DPP_BASE .. '/repos/github.com/' .. a:plugin
    if !dir->isdirectory()
        execute '!git clone https://github.com/' .. a:plugin dir
    endif
    execute 'set runtimepath^='
        \ .. dir->fnamemodify(':p')->substitute('[/\\]$', '', '')
endfunction


function DppMakeState()
    call dpp#make_state($DPP_BASE, '$CONFIG_BASE/dpp.ts'->expand())
endfunction


let $DPP_BASE    = '~/.cache/dpp'->expand()
let $CONFIG_BASE = '<script>:h'->expand()

if !$DPP_BASE->isdirectory()
    call mkdir($DPP_BASE)
endif

call s:dppInitPlugin('Shougo/dpp.vim')
call s:dppInitPlugin('Shougo/dpp-ext-lazy')

if dpp#min#load_state($DPP_BASE)
    for s:plugin in [
            \   'Shougo/dpp-ext-installer',
            \   'Shougo/dpp-ext-local',
            \   'Shougo/dpp-ext-packspec',
            \   'Shougo/dpp-ext-toml',
            \   'Shougo/dpp-protocol-git',
            \   'vim-denops/denops.vim',
            \ ]
        call s:dppInitPlugin(s:plugin)
    endfor

    autocmd User DenopsReady
        \ : echohl WarningMsg
        \ | echomsg 'dpp load_state() is failed'
        \ | echohl NONE
        \ | call DppMakeState()
else
    autocmd BufWritePost *.lua,*.vim,*.toml,*.ts,vimrc,.vimrc
        \ call dpp#check_files()

    autocmd BufWritePost *.toml
        \ : if !dpp#sync_ext_action('installer', 'getNotInstalled')->empty()
        \ |  call dpp#async_ext_action('installer', 'install')
        \ | endif
endif

autocmd User Dpp:makeStatePost
      \ : echohl WarningMsg
      \ | echomsg 'dpp make_state() is done'
      \ | echohl NONE

