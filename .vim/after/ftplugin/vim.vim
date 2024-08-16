let g:vim_indent = #{
    \   line_continuation: shiftwidth(),
    \   more_in_bracket_block: v:true,
    \   searchpair_timeout: 100   
    \}

call lexima#add_rule(#{
    \   char: '<CR>', 
    \   at: '{\%#}',
    \   input: '<CR>\<Tab>',
    \   input_after: '<CR>\',
    \   filetype: 'vim'
    \})
