let $CACHE = '~/.cache'->expand()
if !$CACHE->isdirectory()
    call mkdir($CACHE, 'p')
endif

function s:initDppPlugin(plugin) abort
    let l:dir = $CACHE .. '/dpp/repos/github.com/' .. a:plugin
    if !l:dir->isdirectory()
        execute '!git clone https://github.com/' .. a:plugin l:dir
    endif

    execute 'set runtimepath^=' .. l:dir->fnamemodify(':p')->substitute('[/\\]$', '', '')
endfunction

