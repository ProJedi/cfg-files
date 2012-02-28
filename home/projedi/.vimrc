syntax on

if has('gui_running')
   set background=dark
   colorscheme solarized
   set guioptions="a"
   set guifont=Monaco\ 9
   set lines=100 columns=500
   map <C-S-V> "*p
endif

filetype plugin on

au BufEnter *.hsc setlocal filetype=haskell
au BufEnter *.hamlet setlocal filetype=hamlet
au BufEnter *.cassius setlocal filetype=cassius
au BufEnter *.julius setlocal filetype=julius
au BufEnter *.scala setlocal filetype=scala

set ruler
set nocompatible
set showcmd
set number
set hlsearch
set incsearch
set autoindent
set tabstop=3
set shiftwidth=3
set expandtab
set foldmethod=syntax

map <F3> <C-W>+
map <F4> <C-W>-
map <F5> <C-W><
map <F6> <C-W>>
