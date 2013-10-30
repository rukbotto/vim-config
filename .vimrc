runtime bundle/pathogen/autoload/pathogen.vim

execute pathogen#infect()
execute pathogen#helptags()

syntax on
filetype plugin indent on
colorscheme wombat256

highlight ColorColumn ctermbg=DarkMagenta guibg=DarkMagenta

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
set colorcolumn=80
set wrap
set linebreak
set nolist
set hlsearch
set incsearch
set tags=~/ctags

let mapleader=","

noremap <Leader>rc :vsplit $MYVIMRC<CR>
noremap <Leader>grc :vsplit $MYGVIMRC<CR>

nnoremap <Leader>h :help
nnoremap <Leader>w :w<CR>
nnoremap <Leader>wn :w
nnoremap <Leader>q :q<CR>
nnoremap <Leader>qa :qa<CR>
nnoremap <Leader>qf :q!<CR>
nnoremap <Leader>vn :vne<CR>
nnoremap <Leader>tn :tab :new<CR>
nnoremap <Leader>so :so %<CR>
nnoremap <Leader>nt :NERDTreeToggle<CR>
nnoremap <Leader><Space> :nohlsearch<CR>
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <S-k> <C-w>k
nnoremap <S-j> <C-w>j
nnoremap <S-h> <C-w>h
nnoremap <S-l> <C-w>l
nnoremap <Tab> :tabn<CR>
nnoremap <S-Tab> :tabp<CR>
nnoremap k gk
nnoremap j gj
nnoremap / /\v

inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap jj <Esc>

vnoremap / /\v

if has("autocmd")
  autocmd! BufWritePost .vimrc :source $MYVIMRC
endif

