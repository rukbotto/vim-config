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

let mapleader=","

nmap <leader>rc :vsplit $MYVIMRC<CR>

nnoremap <leader>h :help 
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>qf :q!<CR>
nnoremap <leader>vn :vne<CR>
nnoremap <leader>tn :tab :new<CR>
nnoremap <leader>tc :tabc<CR>
nnoremap <leader>nt :NERDTreeToggle<CR>

if has("autocmd")
  autocmd FocusLost * :wa
  autocmd! BufWritePost .vimrc :so $MYVIMRC
endif

