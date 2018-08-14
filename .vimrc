set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-surround'
Plugin 'SirVer/ultisnips.git'
Plugin 'othree/html5.vim.git'
Plugin 'mattn/emmet-vim.git'
Plugin 'nelstrom/vim-qargs.git'
Plugin 'mitsuhiko/vim-jinja'
Plugin 'digitaltoad/vim-pug'
Plugin 'tpope/vim-commentary'
Plugin 'jdonaldson/vaxe'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-repeat'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-obsession'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'tpope/vim-vinegar'
Plugin 'rukbotto/vim-mustache-handlebars'
Plugin 'mhinz/vim-signify'
Plugin 'plasticboy/vim-markdown'
Plugin 'scrooloose/nerdtree'
Plugin 'craigemery/vim-autotag'
Plugin 'KabbAmine/vCoolor.vim'
Plugin 'vim-scripts/loremipsum'
Plugin 'wesQ3/vim-windowswap'

" Color schemes
Plugin 'chriskempson/base16-vim'

call vundle#end()

syntax on
filetype plugin indent on

" Check if terminal supports truecolor
let color=$COLORTERM
if color ==? "truecolor" && has("termguicolors")
    " Set Vim-specific sequences for RGB colors
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

    " Enable 24-bit color
    set termguicolors
endif

" Enable matchit macro
runtime macros/matchit.vim

" Insert spaces instead of tabs when indenting text
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Allow backspace over everything in insert mode
set backspace=2

" Autoindent text
set autoindent

" Set encoding to utf-8
set encoding=utf-8

" Display info at the bottom of each window
set ruler

" Display line numbers
set number

" No color column
set colorcolumn=

" Don't wrap lines
set nowrap

" Highlight all search matches as we type
set hlsearch
set incsearch

" Use a popup menu for displaying completions
set completeopt=menu

" All windows will have a status line
set laststatus=2

" Line numbers are relative to the current line
set relativenumber

" Use special unicode chars for displaying hidden tab chars, trail spaces and
" whitespace
set list listchars=tab:\+\ ,trail:.,extends:»,precedes:«

" Make clipboard work with tmux
set clipboard=unnamed

" Leader and local leader remappings
let mapleader=","
let maplocalleader="\\"

" =============================================================================
" Normal mode mappings
" =============================================================================

" Window mappings
noremap <Leader>k :wincmd k<CR>
noremap <Leader>j :wincmd j<CR>
noremap <Leader>h :wincmd h<CR>
noremap <Leader>l :wincmd l<CR>
noremap <Leader>K <C-W>K
noremap <Leader>J <C-W>J
noremap <Leader>H <C-W>H
noremap <Leader>L <C-W>L
noremap <Leader>wx <C-W>,
noremap <Leader>wr <C-W>r
noremap <Leader>wo <C-W>o
noremap <Leader>wt <C-W>T
noremap <Leader>w- <C-W><C-_>
noremap <Leader>w\ <C-W><Bar>
noremap <Leader>w= <C-W><C-=>

" Tab mappings
noremap <Leader>> :tabmove+<CR>
noremap <Leader>< :tabmove-<CR>
noremap <Leader>tn :tabnew<CR>
noremap <Leader>tc :tabclose<CR>
noremap <Leader>tfc :tabclose!<CR>
noremap <Leader>to :tabonly<CR>
noremap <Leader>tfo :tabonly!<CR>

" Open .vimrc.local in the current buffer
noremap <Leader>rc :edit $MYVIMRC.local<CR>

" Execute the string subtitution command
nnoremap <Leader>s :%substitute//

" Fuzzy find files
nnoremap <Leader><Space> :Files<CR>

" Fuzzy find buffers
nnoremap <Leader>b :Buffers<CR>

" Fuzzy find tags
nnoremap <Leader>tg :Tags<CR>

" Search for a pattern in current buffer
nnoremap / /\v

" Toggle NERDTree window
nnoremap <Leader>ntt :NERDTreeToggle<CR>

" Reveal current file in NERDTree window
nnoremap <Leader>ntf :NERDTreeFind<CR>

" Display color picker
nnoremap <Leader>v :VCoolor<CR>

" =============================================================================
" Insert mode mappings
" =============================================================================

" Disable arrow keys in insert mode
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

" =============================================================================
" Visual mode mappings
" =============================================================================

" Search for a pattern in current buffer
vnoremap / /\v

" Search the current word in current buffer
xnoremap * :<C-u> call <SID>SearchVisualSelection()<CR>/<C-r>=@/<CR><CR>

" =============================================================================
" Status line
" =============================================================================

set statusline=
set statusline+=\ %0.40f
set statusline+=\ %m%r
set statusline+=\ %h%w
set statusline+=%=
set statusline+=\ %y
set statusline+=\ %4l/%-4L\ C%-3c
set statusline+=\ %P
set statusline+=\ 

" =============================================================================
" Plugin settings
" =============================================================================

" Markdown settings
let g:markdown_fenced_languages = ['c', 'cpp', 'css', 'haxe', 'html', 'java',
      \ 'javascript', 'python', 'ruby', 'sass', 'scss']

" Jinja settings
let g:htmljinja_disable_detection = 1

" Vaxe settings
let g:vaxe_enable_airline_defaults = 0

" FZF settings
let g:fzf_layout = { 'down': '~20%' }

" Signify settings
let g:signify_vcs_list = ['git', 'hg']

" =============================================================================
" Commands
" =============================================================================

" Delete all hidden buffers
command! -nargs=* Only call CloseHiddenBuffers()

" =============================================================================
" Autocommands
" =============================================================================

if has("autocmd")
    if !exists("autocommands_loaded")
        let autocommands_loaded = 1

        " Set autocompletion functions
        autocmd FileType css set omnifunc=csscomplete#CompleteCSS
        autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType python set omnifunc=pythoncomplete#Complete

        " Set autowrite on
        autocmd FileType haxe set autowrite

        " Set indentation to 4 columns
        autocmd FileType c++,haxe,java,python,vim setlocal tabstop=4
        autocmd FileType c++,haxe,java,python,vim setlocal shiftwidth=4
        autocmd FileType c++,haxe,java,python,vim setlocal softtabstop=4

        " Set line wrapping on
        autocmd FileType markdown setlocal wrap
        autocmd FileType markdown setlocal linebreak

        " Set filetype for haskell files
        autocmd BufNewFile,BufRead *xmobarrc set filetype=haskell

        " Set filetype for xdefaults files
        autocmd BufNewFile,BufRead *Xresources set filetype=xdefaults
    endif
endif

" =============================================================================
" Functions
" =============================================================================

" Select a word in visual mode
function! s:SearchVisualSelection()
    let l:temp = @s
    normal! gv"sy
    let @/ = '\V' . substitute(escape(@s, '\/'), '\n', '\\n', "g")
    let @s = l:temp
endfunction

" Close hidden buffers
function! CloseHiddenBuffers()
    " figure out which buffers are visible in any tab
    let visible = {}
    for t in range(1, tabpagenr('$'))
        for b in tabpagebuflist(t)
            let visible[b] = 1
        endfor
    endfor
    " close any buffer that are loaded and not visible
    let l:tally = 0
    for b in range(1, bufnr('$'))
        if buflisted(b) && !has_key(visible, b)
            let l:tally += 1
            exe 'bw ' . b
        endif
    endfor
    echon "Deleted " . l:tally . " buffers"
endfunction

" =============================================================================
" Source local vimrc file
" =============================================================================

let g:local_vimrc = $HOME . "/.local.vimrc"
if filereadable(g:local_vimrc)
    exec "source " . g:local_vimrc
endif
