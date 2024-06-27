vim9script

#text format
set formatoptions+=mMB]
set formatoptions-=c
set textwidth=71

nmap <buffer> <F5> <Plug>(lsp-document-build)

#vim-lsp-settings
g:texlabBuildSaveFlag = v:true
set statusline+=[%{g:lsp_settings.texlab.workspace_config.texlab.build.onSave}]
map <silent><expr><F2> g:lsp_settings.texlab.workspace_config.texlab.build.onSave == v:true ? 
            \    ':vim9cmd g:lsp_settings.texlab.workspace_config.texlab.build.onSave = v:false<CR>' : 
            \    ':vim9cmd g:lsp_settings.texlab.workspace_config.texlab.build.onSave = v:true<CR>'

g:lsp_settings = {
    'texlab': {
        'workspace_config': {
            'texlab': {
                'build': {
                    'onSave': g:texlabBuildSaveFlag,
                    'args': []
                }
            }
        }
    }
}



#lexima
call lexima#add_rule({'char': '$', 'input_after': '$', 'filetype': ['tex', 'plaintex']})
call lexima#add_rule({'char': '$', 'at': '\%#\$', 'leave': 1, 'filetype': ['tex', 'plaintex']})
call lexima#add_rule({'char': '<BS>', 'at': '\$\%#\$', 'delete': 1, 'filetype': ['tex', 'plaintex']})

call lexima#add_rule({
    \ 'char': '(',
    \ 'at': '\\\%#',
    \ 'input_after': '\)',
    \ 'filetype': ['tex', 'plaintex']
    \ })
                                                               
call lexima#add_rule({
    \ 'char': '<BS>',
    \ 'at': '\\(\%#\\)',
    \ 'delete': 2,
    \ 'input': '<BS><BS>',
    \ 'filetype': ['tex', 'plaintex']
    \ })
                                                               
                                                               
call lexima#add_rule({
    \ 'char': '[',
    \ 'at': '\\\%#',
    \ 'input_after': '\]',
    \ 'filetype': ['tex', 'plaintex']
    \ })
                                                               
call lexima#add_rule({
    \ 'char': '<BS>',
    \ 'at': '\[\%#\\]',
    \ 'delete': 2,
    \ 'input': '<BS><BS>',
    \ 'filetype': ['tex', 'plaintex']
    \ })
                                                               
                                                               
 call lexima#add_rule({
    \ 'char': '{',
    \ 'at': '\\\%#',
    \ 'input_after': '\}',
    \ 'filetype': ['tex', 'plaintex']
    \ })
                                                               
call lexima#add_rule({
    \ 'char': '<BS>',
    \ 'at': '\\{\%#\\}',
    \ 'delete': 2,
    \ 'input': '<BS><BS>',
    \ 'filetype': ['tex', 'plaintex']
    \ })
