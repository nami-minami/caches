"dein Scripts-----------------------------
let $CACHE = expand('$HOME/.cache')
if !isdirectory($CACHE)
  call mkdir($CACHE, 'p')
endif
if &runtimepath !~# '/dein.vim'
  let s:dein_dir = fnamemodify('dein.vim', ':p')
  if !isdirectory(s:dein_dir)
    let s:dein_dir = $CACHE .. '/dein/repos/github.com/Shougo/dein.vim'
    if !isdirectory(s:dein_dir)
      execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
    endif
  endif
  execute 'set runtimepath^=' .. substitute(
        \ fnamemodify(s:dein_dir, ':p'), '[/\\]$', '', '')
endif


if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('$HOME/.cache/dein')

" Let dein manage dein
" Required:
call dein#add('$HOME/.cache/dein/repos/github.com/Shougo/dein.vim')

" Add or remove your plugins here like this:
"call dein"add('Shougo/neosnippet.vim')
"call dein"add('Shougo/neosnippet-snippets')



" ~~~ ここからtomlファイルを利用するための設定 ~~~
  " 導入するプラグインを記載したtomlファイルのパスを記載する
   let s:toml_dir = expand('$HOME/.vim/cache/dein/dein_toml') 
   let s:toml      = s:toml_dir .. '/dein.toml'
   let s:lazy_toml = s:toml_dir .. '/dein_lazy.toml'
  
   " tomlファイルをキャッシュしておくための記述
   call dein#load_toml(s:toml,      {'lazy': 0})
   call dein#load_toml(s:lazy_toml, {'lazy': 1})
  " ~~~ tomlのための設定はここまで ~~~

" Required:
filetype plugin indent on   
call dein#end()


" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------
