set nocompatible
call pathogen#infect("/home/projedi/.vimbundle")
syntax on
filetype plugin indent on

" set background=dark
colorscheme jellybeans

set wildignore+=*.so,*.class,*.hi,*.o

let g:yankring_history_file = '.cache/yankring_history'

let g:clang_hl_errors = 0
let g:clang_user_options = '-std=c++11'
let g:clang_use_library = 1
let g:clang_snippets = 1
let g:clang_snippets_engine = 'clang_complete'

let mapleader = ';'

let g:ctrlp_working_path_mode = 'a'

let g:tex_flavor = "latex"

if has('gui_running')
   set guioptions="a"
   set mouse-=a
   set guifont=AnonymousPro\ 9
   set lines=100 columns=500
   map <C-S-V> "*p
endif

set lazyredraw

au BufEnter *.hsc setlocal filetype=haskell
au BufRead,BufNewFile *.pro set filetype=qmake
"set omnifunc=syntaxcomplete#Complete
"au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main
au BufNewFile,BufRead,BufEnter *.java set omnifunc=javacomplete#Complete
au BufNewFile,BufRead,BufEnter *.java set completefunc=javacomplete#CompleteParamsInfo
" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
" let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

au FileType tex set indentexpr=

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
au BufNewFile,BufRead,BufEnter *.java set tabstop=4
au BufNewFile,BufRead,BufEnter *.java set shiftwidth=4
set expandtab
set foldmethod=syntax
set laststatus=2
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set statusline+=\ \[%{fugitive#head(7)}\]
set encoding=utf-8

map <F3> <C-W>+
map <F4> <C-W>-
map <F5> <C-W><
map <F6> <C-W>>
nnoremap <F8> :noh<CR>
nnoremap <silent> <F11> :YRShow<CR>
nnoremap <silent> <F10> :GundoToggle<CR>

cmap w!! w !sudo tee >/dev/null %

au WinEnter,BufEnter * match ErrorMsg '\%>80v.\+'
inoremap \fn <C-R>=expand("%:t:r")<CR>
