set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

let g:vundle_default_git_proto = 'git'

Bundle 'gmarik/vundle'

Bundle 'FuzzyFinder'
Bundle 'L9'
Bundle 'YankRing.vim'
Bundle 'javacomplete'
Bundle 'LaTeX-Box-Team/LaTeX-Box'
Bundle 'Valloric/YouCompleteMe'
Bundle 'spolu/dwm.vim'
Bundle 'sjl/gundo.vim'
Bundle 'nanotech/jellybeans.vim'
Bundle 'bitc/lushtags'
Bundle 'ujihisa/neco-ghc'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'artoj/qmake-syntax-vim'
Bundle 'godlygeek/tabular'
Bundle 'majutsushi/tagbar'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-fugitive'
Bundle 'dag/vim2hs'

"call pathogen#infect("/home/projedi/.vimbundle")

filetype plugin indent on

if has('gui_running')
   set guioptions="a"
   set mouse-=a
   set guifont=AnonymousPro\ 9
   map <C-S-V> "*p
endif

syntax on
colorscheme jellybeans

set encoding=utf-8
set wildignore+=*.so,*.class,*.hi,*.o
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
set statusline=\[%{fugitive#head(7)}\]\ %<%f\ %h%m%r%=%L
set lazyredraw
set completeopt=menu,menuone,longest

nnoremap <F8> :noh<CR>
nnoremap <silent> <F3> :YRShow<CR>
nnoremap <silent> <F4> :GundoToggle<CR>
nnoremap <silent> <F10> :TagbarToggle<CR>
nnoremap <silent> <F11> :NERDTreeToggle<CR>
cnoremap w!! w !sudo tee >/dev/null %
" Snippet-ish: inserts current filename
inoremap \fn <C-R>=expand("%:t:r")<CR>
let g:yankring_replace_n_pkey = ''
let g:yankring_replace_n_nkey = ''
nnoremap <C-P> :FufBuffer<CR>

" Higlight everything after 80 column with ErrorMsg style
au BufEnter * match ErrorMsg '\%>80v.\+'

au BufEnter *.hsc setlocal filetype=haskell
au BufEnter *.pro setlocal filetype=qmake

au FileType java set omnifunc=javacomplete#Complete
au FileType java set completefunc=javacomplete#CompleteParamsInfo
au FileType haskell set omnifunc=necoghc#omnifunc

au FileType tex set indentexpr=

au FileType java set tabstop=4
au FileType java set shiftwidth=4

" Don't screw up folds when inserting text that might affect them, until
" leaving insert mode. Foldmethod is local to the window. Protect against
" screwing up folding when switching between windows.
au InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
au InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

let &viminfo='/home/projedi/.cache/.viminfo'
let mapleader = ';'
let g:tex_flavor = "latex"

let g:yankring_history_file = '.cache/yankring_history'

let g:fuf_dataDir = '~/.cache/vim-fuf-data'

let g:LatexBox_Folding = 1
let g:LatexBox_fold_envs = 1
