set nocompatible    "vimをvi互換モードではなくvimとして使用


filetype plugin indent on   "ファイル種類，インデント設定読み込み

"インデント設定
"------------------------------------------------------------------------
syntax on           "シンタックスハイライト
colorscheme default
set ruler           "右下にカーソル位置を表示
set number          "行番号を表示
set tabstop=4       "タブ幅=4
set shiftwidth=4    "自動挿入インデント幅=4
set nowrap          "行の折り返し設定-折り返しなし
set showcmd         "入力中のコマンドを表示
set backspace=3     "バックスペース有効化
set virtualedit=onemore


"検索
"------------------------------------------------------------------------
set hlsearch    "検索結果をハイライト
set ignorecase  "検索時大文字小文字を区別しない
set smartcase   "小文字で検索時大文字小文字を無視して検索

"set autoindent

"set list

set wildmenu
set showcmd

set softtabstop=4
set expandtab
set smarttab

set clipboard=unnamed

if has('vim_starting')
    " 挿入モード時に非点滅の縦棒タイプのカーソル
    let &t_SI .= "\e[6 q"
    " ノーマルモード時に非点滅のブロックタイプのカーソル
    let &t_EI .= "\e[2 q"
    " 置換モード時に非点滅の下線タイプのカーソル
    let &t_SR .= "\e[4 q"
endif

"set filetype----------------------------
"filetype plugin on






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
        \ fnamemodify(s:dein_dir, ':p') , '[/\\]$', '', '')
endif

"dein Scripts-----------------------------
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
"call dein#add('Shougo/neosnippet.vim')
"call dein#add('Shougo/neosnippet-snippets')



" ~~~ ここからtomlファイルを利用するための設定 ~~~
  " 導入するプラグインを記載したtomlファイルのパスを記載する
   let s:toml_dir  = expand('$HOME/.cache/dein/dein_toml') 
   let s:toml      = s:toml_dir . '/dein.toml'
   let s:lazy_toml = s:toml_dir . '/dein_lazy.toml'
  
   " tomlファイルをキャッシュしておくための記述
   call dein#load_toml(s:toml,      {'lazy': 0})
   call dein#load_toml(s:lazy_toml, {'lazy': 1})
  " ~~~ tomlのための設定はここまで ~~~

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------




