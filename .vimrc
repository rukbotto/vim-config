runtime bundle/pathogen/autoload/pathogen.vim

execute pathogen#infect()
execute pathogen#helptags()

syntax on
filetype plugin indent on
colorscheme wombat256

highlight ColorColumn ctermbg=DarkCyan guibg=DarkCyan

set nocompatible
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set encoding=utf-8
set autoindent
set cursorline
set ruler
set number
set colorcolumn=80
set wrap
set linebreak
set nolist
set hlsearch
set incsearch

let mapleader=","
let maplocalleader="\\"

noremap <Leader>rc :edit $MYVIMRC<CR>
noremap <Leader>lrc :edit $MYVIMRC.local<CR>
noremap <Leader>grc :edit $MYGVIMRC<CR>

nnoremap <Leader>h :help
nnoremap <Leader>w :write<CR>
nnoremap <Leader>wn :write
nnoremap <Leader>q :quit<CR>
nnoremap <Leader>qa :qall<CR>
nnoremap <Leader>qf :quit!<CR>
nnoremap <Leader>qaf :qall!<CR>
nnoremap <Leader>vn :vnew<CR>
nnoremap <Leader>tn :tab :new<CR>
nnoremap <Leader>so :source %<CR>
nnoremap <Leader><Space> :nohlsearch<CR>
nnoremap <Leader>s :%substitute//
nnoremap <Leader>nt :NERDTreeToggle<CR>
nnoremap <Leader>tgc :VimCtagsCompile<CR>
nnoremap <Leader>tgs :VimCtagsScanDirs<CR>
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <S-k> <C-w>k
nnoremap <S-j> <C-w>j
nnoremap <S-h> <C-w>h
nnoremap <S-l> <C-w>l
nnoremap <Tab> :tabnext<CR>
nnoremap <S-Tab> :tabprevious<CR>
nnoremap k gk
nnoremap j gj
nnoremap / /\v

inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Esc> <Nop>
inoremap jj <Esc>

vnoremap / /\v

xnoremap * :<C-u> call <SID>SearchVisualSelection()<CR>/<C-r>=@/<CR><CR>

function! s:SearchVisualSelection()
    let l:temp = @s
    normal! gv"sy
    let @/ = '\V' . substitute(escape(@s, '\/'), '\n', '\\n', "g")
    let @s = l:temp
endfunction

if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif

if has("autocmd")
    autocmd! BufWritePost .vimrc source $MYVIMRC
endif
