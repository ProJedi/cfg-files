set nocompatible
call pathogen#infect("/home/projedi/.vimbundle")
syntax on
filetype plugin indent on

" set background=dark
colorscheme jellybeans

if has('gui_running')
   set guioptions="a"
   set mouse-=a
   set guifont=AnonymousPro\ 9
   set lines=100 columns=500
   map <C-S-V> "*p
endif

au BufEnter *.hsc setlocal filetype=haskell
au BufRead,BufNewFile *.pro set filetype=qmake
set omnifunc=syntaxcomplete#Complete
au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main

let &viminfo='/home/projedi/.cache/.viminfo'

" Don't screw up folds when inserting text that might affect them, until
" leaving insert mode. Foldmethod is local to the window. Protect against
" screwing up folding when switching between windows.
autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

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
set laststatus=2
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set statusline+=\ \[%{fugitive#head(7)}\]
set encoding=utf-8
let g:Powerline_symbols = 'unicode'
let g:Powerline_colorscheme = 'default'

map <F3> <C-W>+
map <F4> <C-W>-
map <F5> <C-W><
map <F6> <C-W>>
nnoremap <F8> :noh<CR>
