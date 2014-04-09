runtime bundle/pathogen/autoload/pathogen.vim

execute pathogen#infect()
execute pathogen#helptags()

syntax on
filetype plugin indent on
colorscheme monokai

highlight ColorColumn ctermbg=237 guibg=#3c3d37

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
set completeopt=menu
set laststatus=2
set scrolloff=8

let mapleader=","
let maplocalleader="\\"

" =============================================================================
" Normal mode mappings
" =============================================================================

noremap <Leader>rc :edit $MYVIMRC<CR>
noremap <Leader>lrc :edit $MYVIMRC.local<CR>
noremap <Leader>grc :edit $MYGVIMRC<CR>

nnoremap <Leader>h :help
nnoremap <Leader>w :write<CR>
nnoremap <Leader>wa :wall<CR>
nnoremap <Leader>wn :write
nnoremap <Leader>q :quit<CR>
nnoremap <Leader>qa :qall<CR>
nnoremap <Leader>qf :quit!<CR>
nnoremap <Leader>qaf :qall!<CR>
nnoremap <Leader>vn :vnew<CR>
nnoremap <Leader>nw :new<CR>
nnoremap <Leader>tn :tab :new<CR>
nnoremap <Leader>tc :tabclose<CR>
nnoremap <Leader>so :source %<CR>
nnoremap <Leader><Space> :nohlsearch<CR>
nnoremap <Leader>s :%substitute//
nnoremap <Leader>1 :NERDTreeToggle<CR>
nnoremap <Leader>2 :TagbarToggle<CR>
nnoremap <Leader>es :UltiSnipsEdit<CR>
nnoremap <Leader>n :set norelativenumber!<CR>
nnoremap <Leader>b :buffer
nnoremap <Leader>bn :bnext<CR>
nnoremap <Leader>bp :bprevious<CR>
nnoremap <Leader>bd :bdelete<CR>
nnoremap <Leader>qg :Qargs<CR>
nnoremap <Leader>ad :argdo
nnoremap <Leader>vg :vimgrep /
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap K <C-w>k
nnoremap J <C-w>j
nnoremap H <C-w>h
nnoremap L <C-w>l
nnoremap HH <C-w>H
nnoremap LL <C-w>K
nnoremap JJ <C-f>
nnoremap KK <C-b>
nnoremap = <C-w>=
nnoremap <Tab> :tabnext<CR>
nnoremap <S-Tab> :tabprevious<CR>
nnoremap / /\v

" =============================================================================
" Insert mode mappings
" =============================================================================

inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

" =============================================================================
" Visual mode mappings
" =============================================================================

vnoremap / /\v
xnoremap * :<C-u> call <SID>SearchVisualSelection()<CR>/<C-r>=@/<CR><CR>

" =============================================================================
" Function for selecting a word in visual mode
" =============================================================================

function! s:SearchVisualSelection()
    let l:temp = @s
    normal! gv"sy
    let @/ = '\V' . substitute(escape(@s, '\/'), '\n', '\\n', "g")
    let @s = l:temp
endfunction

" =============================================================================
" NERDTree bundle settings
" =============================================================================

let NERDTreeQuitOnOpen = 1
let NERDTreeShowBookmarks = 1
let NERDTreeShowHidden = 1

" =============================================================================
" UltiSnips bundle settings
" =============================================================================

let g:UltiSnipsEditSplit = "vertical"

" =============================================================================
" Airline bundle settings
" =============================================================================

let g:airline_left_sep = ' '
let g:airline_right_sep = ' '

" =============================================================================
" Tagbar bundle settings
" =============================================================================

let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1

" =============================================================================
" Django bundle settings
" =============================================================================

let g:django_activate_virtualenv = 1

" =============================================================================
" Source local vimrc file
" =============================================================================

if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif

" =============================================================================
" Autocommands
" =============================================================================

if has("autocmd")
    if !exists("autocommands_loaded")
        let autocommands_loaded = 1
        autocmd FileType haxe set autowrite
        autocmd FileType hxml set autowrite
        autocmd FileType python set omnifunc=pythoncomplete#Complete
        autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
        autocmd FileType css set omnifunc=csscomplete#CompleteCSS
        autocmd BufWritePost .vimrc source $MYVIMRC
    endif
endif
