set nocompatible
syntax on
filetype plugin indent on

set background=dark
colorscheme solarized

if has('gui_running')
   set guioptions="a"
   set mouse-=a
   set guifont=Anonymous\ Pro\ 9
   set lines=100 columns=500
   map <C-S-V> "*p
endif

au BufEnter *.hsc setlocal filetype=haskell

set ruler
set showcmd
set number
set hlsearch
set incsearch
set backspace=indent,eol,start
set autoindent
set tabstop=3
set shiftwidth=3
set expandtab
set foldmethod=syntax

map <F3> <C-W>+
map <F4> <C-W>-
map <F5> <C-W><
map <F6> <C-W>>
