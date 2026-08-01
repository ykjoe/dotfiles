" vim & vi compatible
set nocompatible
set shortmess+=I

" Text Display Mode
syntax on

" Line Numbers.
set number
set relativenumber

" Status Line
set laststatus=2

" Operation
set backspace=indent,eol,start
set hidden
" -Searching
set ignorecase
set smartcase
set incsearch

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

