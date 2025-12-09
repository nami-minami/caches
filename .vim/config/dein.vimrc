vim9script


#dein Scripts-----------------------------
$CACHE = expand('~/.cache')
if !isdirectory($CACHE)
  call mkdir($CACHE, 'p')
endif
if &runtimepath !~# '/dein.vim'
  var dein_dir = fnamemodify('dein.vim', ':p')
  if !isdirectory(dein_dir)
    dein_dir = $CACHE .. '/dein/repos/github.com/Shougo/dein.vim'
    if !isdirectory(dein_dir)
      execute '!git clone https://github.com/Shougo/dein.vim' dein_dir
    endif
  endif
  execute 'set runtimepath^=' .. substitute(
        \ fnamemodify(dein_dir, ':p'), '[/\\]$', '', '')
endif


if &compatible
  set nocompatible               # Be iMproved
endif

# Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

# Required:
call dein#begin('~/.cache/dein')

# Let dein manage dein
# Required:
call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

# Add or remove your plugins here like this:
#call dein#add('Shougo/neosnippet.vim')
#call dein#add('Shougo/neosnippet-snippets')



# ~~~ ここからtomlファイルを利用するための設定 ~~~
  # 導入するプラグインを記載したtomlファイルのパスを記載する
   var toml_dir = expand('~/.vim/config') 
   var toml      = toml_dir .. '/dein.toml'
   var lazy_toml = toml_dir .. '/dein_lazy.toml'
   var ddc_toml = toml_dir .. '/ddc.toml'
   var ddu_toml = toml_dir .. '/ddu.toml'
  
   # tomlファイルをキャッシュしておくための記述
   call dein#load_toml(toml,      {'lazy': 0})
   call dein#load_toml(lazy_toml, {'lazy': 1})
   call dein#load_toml(ddc_toml, {'lazy': 1})
   call dein#load_toml(ddu_toml, {'lazy': 1})
  # ~~~ tomlのための設定はここまで ~~~

# Required:
filetype plugin indent on
call dein#end()


# If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

#End dein Scripts-------------------------
