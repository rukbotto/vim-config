runtime bundle/pathogen/autoload/pathogen.vim

execute pathogen#infect()
execute pathogen#helptags()

syntax on
filetype plugin indent on
colorscheme Monokai

set nocompatible
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set encoding=utf-8
set autoindent
set cursorline
set ruler
set wildmenu
set number
set omnifunc=syntaxcomplete#Complete
set colorcolumn=79
set wrap
set linebreak
set nolist

let mapleader=","

nmap <Leader>rc :vsplit $MYVIMRC<CR>

nnoremap <Leader>h :help 
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>qf :q!<CR>
nnoremap <Leader>vn :vne<CR>
nnoremap <Leader>tn :tab :new<CR>
nnoremap <Leader>nt :NERDTreeToggle<CR>
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <S-k> <C-w>k
nnoremap <S-j> <C-w>j
nnoremap <S-h> <C-w>h
nnoremap <S-l> <C-w>l
nnoremap k gk
nnoremap j gj

inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

if has("autocmd")
  autocmd FocusLost * :wa
  autocmd! BufWritePost .vimrc :so $MYVIMRC
endif

