set nocompatible
filetype off

set rtp+=~projedi/.vim/bundle/vundle
call vundle#rc()

let g:vundle_default_git_proto = 'git'

Bundle 'gmarik/vundle'

Bundle 'FuzzyFinder'
Bundle 'L9'
Bundle 'YankRing.vim'
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
" This one needs some tweaking
"Bundle 'hlissner/vim-multiedit'
Bundle 'szw/vim-smartclose.git'
Bundle 'terryma/vim-multiple-cursors'

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
set relativenumber
set hlsearch
set incsearch
set backspace=indent,eol,start
set autoindent
set tabstop=3
set shiftwidth=3
set expandtab
set foldmethod=syntax
set laststatus=2
set statusline=\[%{fugitive#head(7)}\]\ %<%f\ %h%m%r%=%L,%c
set lazyredraw
set completeopt=menu,menuone,longest

if has("cscope")
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
       cs add cscope.out
   " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
       cs add $CSCOPE_DB
   endif
   set csverb
   set cscopetag
endif

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
" This is now used in multiple cursors plugin
nnoremap <C-P> :FufBuffer<CR>
imap <C-k> <Esc>
vmap <C-k> <Esc>
cmap <C-k> <Esc>
vnoremap / <Esc>`</\%V
vnoremap ? <Esc>`>?\%V

call matchadd('ErrorMsg', '\s\+$')
call matchadd('ErrorMsg', '\%>80v.\+')

au FocusLost * set number
au FocusGained * set relativenumber
au InsertEnter * set number
au InsertLeave * set relativenumber

au BufEnter *.hsc setlocal filetype=haskell
au BufEnter *.pro setlocal filetype=qmake

au FileType haskell set omnifunc=necoghc#omnifunc

au FileType tex set indentexpr=

au FileType java set tabstop=4
au FileType java set shiftwidth=4

" Don't screw up folds when inserting text that might affect them, until
" leaving insert mode. Foldmethod is local to the window. Protect against
" screwing up folding when switching between windows.
"au InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
"au InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

let &viminfo='/home/projedi/.cache/.viminfo'
let mapleader = ';'
let g:tex_flavor = "latex"

let g:yankring_history_file = '.cache/yankring_history'

let g:fuf_dataDir = '~/.cache/vim-fuf-data'

let g:LatexBox_Folding = 1
let g:LatexBox_fold_envs = 1

let NERD_haskell_alt_style=0

let g:ycm_global_ycm_extra_conf='~projedi/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'

let g:smartclose_default_mapping_key = '<F7>'

"let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_next_key = '<A-n>'
let g:multi_cursor_prev_key = '<A-p>'
let g:multi_cursor_skip_key = '<C-x>'
let g:multi_cursor_quit_key = '<C-k>'
