set formatoptions+=mM
set textwidth=71

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
                                                               
                                                               
call lexima#add_rule({
    \ 'char': '<CR>',
    \ 'at': '\\begin{\(.*\)\%#}',
    \ 'leave': '}',
    \ 'input': '<CR>',
    \ 'input_after': '<CR>\\end{\1}',
    \ 'with_submatch': 1,
    \ 'filetype': ['tex', 'plaintex']
    \ })
                                                               

call lexima#add_rule({
    \ 'char': '<CR>',
    \ 'at': '\(\\documentclass.*{\%#}\|\\usepackage{.*\%#}\)',
    \ 'leave': '}',
    \ 'input': '<CR>',
    \ 'filetype': ['tex', 'plaintex']
    \ })
