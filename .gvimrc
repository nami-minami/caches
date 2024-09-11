" Make external commands work through a pipe instead of a pseudo-tty
"set noguipty

"augroup RunGUI
"    autocmd!
"    autocmd GUIEnter !*.tex set fullscreen
"augroup END

"function! g:GUIEnter() abort
"    if &filetype == 'tex'
"        return
"    else  
"       set fullscreen 
"    endif
"endfunction
"
"augroup RunGUI
"    autocmd!
"    autocmd GUIEnter * call g:GUIEnter()
"augroup END



" set the X11 font to use
" set guifont=-misc-fixed-medium-r-normal--14-130-75-75-c-70-iso8859-1
set guifont=Menlo:h14

set ch=2		" Make command line two lines high

set mousehide		" Hide the mouse when typing text

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

"" Only do this for Vim version 5.0 and later.
"if version >= 500
"
"  " Switch on syntax highlighting if it wasn't on yet.
"  if !exists("syntax_on")
"    syntax on
"  endif
"
"  " For Win32 version, have "K" lookup the keyword in a help file
"  "if has("win32")
"  "  let winhelpfile='windows.hlp'
"  "  map K :execute "!start winhlp32 -k <cword> " . winhelpfile <CR>
"  "endif
"
"  " Set nice colors
"  " background for normal text is light grey
"  " Text below the last line is darker grey
"  " Cursor is green, Cyan when ":lmap" mappings are active
"  " Constants are not underlined but have a slightly lighter background
"  highlight Normal guibg=grey90
"  highlight Cursor guibg=Green guifg=NONE
"  highlight lCursor guibg=Cyan guifg=NONE
"  highlight NonText guibg=grey80
"  highlight Constant gui=NONE guibg=grey95
"  highlight Special gui=NONE guibg=grey95
"
"endif


call togglebg#map("<F2>")


let g:terminal_ansi_colors = [
\ '#073642', 
\ '#dc322f', 
\ '#859900', 
\ '#b58900', 
\ '#268bd2', 
\ '#d33682', 
\ '#2aa198', 
\ '#eee8d5', 
\ '#002b36', 
\ '#cb4b16', 
\ '#586e75', 
\ '#657b83', 
\ '#839496', 
\ '#6c71c4', 
\ '#93a1a1', 
\ '#fdf6e3', 
\ ]

highlight link Terminal Normal


function s:IMEOff()
    !osascript ~/IMEOff.scpt
endfunction

augroup GUIOnFocus
    autocmd!
    autocmd FocusGained * silent call s:IMEOff()
augroup End
