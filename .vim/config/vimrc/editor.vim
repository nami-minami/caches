vim9script

#editor 
set nocompatible
scriptencoding utf-8
set encoding=utf-8
set clipboard=unnamed
set hidden


#indent
syntax enable        
set ruler            
set number          
set expandtab
set softtabstop=4
set shiftwidth=4
set smarttab
set wrap          
set showcmd         
set backspace=3     
#set virtualedit=onemore
#set autoindent


#searching
set hlsearch    
set ignorecase  
set smartcase   

set wildmenu


#statusline
set laststatus=2
set statusline=%F  #display file name
set statusline+=[LOW=%l/%L]  #current line number
set statusline+=%c%V
set statusline+=%=[%{skkeleton#mode()}]


#cursor shape
if has("vim_starting")
    &t_SI = "\e[6 q"    
    &t_SR = "\e[4 q"    
    &t_EI = "\e[2 q"    
endif


#filetype
filetype plugin indent on   
g:tex_flavor = "latex"
