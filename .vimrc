set nocompatible
filetype off

set rtp+=~/.dotvim/bundle/Vundle.vim

call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'wincent/Command-T'
Plugin 'tpope/vim-surround'
Plugin 'SirVer/ultisnips.git'
Plugin 'bling/vim-airline.git'
Plugin 'othree/html5.vim.git'
Plugin 'mattn/emmet-vim.git'
Plugin 'genoma/vim-less'
Plugin 'nelstrom/vim-qargs.git'
Plugin 'JulesWang/css.vim.git'
Plugin 'rukbotto/vim-django'
Plugin 'plasticboy/vim-markdown'
Plugin 'mitsuhiko/vim-jinja'

" Color schemes
Plugin 'tomasr/molokai'
Plugin 'git@bitbucket.org:rukbotto/smyck.vim.git'

" Airline themes
Plugin 'paranoida/vim-airlineish'

call vundle#end()

syntax on
filetype plugin indent on

" Enable matchit macro
runtime macros/matchit.vim

" Set colorscheme
colorscheme molokai

" Insert spaces instead of tabs when indenting text
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Autoindent text
set autoindent

" Set encoding to utf-8
set encoding=utf-8

" highlight the current line
set cursorline

" Display info at the bottom of each window
set ruler

" Display line numbers
set number

" Display a color column 80 chars at the right
set colorcolumn=80

" Set the colorcolumn color to dark grey
highlight ColorColumn ctermbg=8

" Wrap long lines
set wrap
set linebreak

" Highlight all search matches as we type
set hlsearch
set incsearch

" Use a popup menu for displaying completions
set completeopt=menu

" All windows will have a status line
set laststatus=2

" Cursor will be 8 lines away from top/down edges when scrolling
set scrolloff=8

" Line numbers are relative to the current line
set relativenumber

" Use special unicode chars for displaying hidden tab chars, trail spaces and
" whitespace
set list
exec "set listchars=tab:\uBB\uBB,trail:\uAB,nbsp:."

" Leader and local leader remappings
let mapleader=","
let maplocalleader="\\"

" =============================================================================
" Normal mode mappings
" =============================================================================

" Open .vimrc in the current buffer
noremap <Leader>rc :edit $MYVIMRC<CR>

" Open .vimrc.local in the current buffer
noremap <Leader>lrc :edit $MYVIMRC.local<CR>

" Open .gvimrc in the current buffer
noremap <Leader>grc :edit $MYGVIMRC<CR>

" Turn off search highlights
nnoremap <Leader><Space> :nohlsearch<CR>

" Execute the string subtitution command
nnoremap <Leader>s :%substitute//

" Toggle relative line numbers
nnoremap <Leader>n :set norelativenumber!<CR>

" Set spell checking in current buffer
nnoremap <Leader>sp :setlocal spell spelllang=

" Disable arrow keys in normal mode
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>

" Search for a pattern in current buffer
nnoremap / /\v

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
" Function for selecting a word in visual mode
" =============================================================================

function! s:SearchVisualSelection()
    let l:temp = @s
    normal! gv"sy
    let @/ = '\V' . substitute(escape(@s, '\/'), '\n', '\\n', "g")
    let @s = l:temp
endfunction

" =============================================================================
" UltiSnips settings
" =============================================================================

let g:UltiSnipsExpandTrigger = "<C-h>"

" =============================================================================
" Airline settings
" =============================================================================

let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_theme = "molokai"

" =============================================================================
" Command-T settings
" =============================================================================

let g:CommandTWildIgnore = &wildignore . ",*.pyc,*.jpg,*.jpeg,*.png,*.swp,"
    \ . "*.swo,*.pdf,*.ai,*.psd,*.eot,*.svg,*.ttf,*.woff,node_modules"
let g:CommandTMaxFiles = 50000

" =============================================================================
" Markdown settings
" =============================================================================

let g:vim_markdown_frontmatter = 1
let g:vim_markdown_folding_disabled = 1

" =============================================================================
" Jinja settings
" =============================================================================

let g:htmljinja_disable_detection = 1

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
        autocmd FileType python set omnifunc=pythoncomplete#Complete
        autocmd FileType css set omnifunc=csscomplete#CompleteCSS

        " Autocommands for html files
        " ---------------------------------------------------------------------

        autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

        " Text is not wrapped, color column is not displayed
        autocmd FileType html setlocal nowrap
        autocmd FileType html setlocal colorcolumn=""

        " Autocommands for htmldjango files
        " ---------------------------------------------------------------------

        " Text is not wrapped, color column is not displayed
        autocmd FileType htmldjango setlocal nowrap
        autocmd FileType htmldjango setlocal colorcolumn=""

        " Autocommands for htmljinja files
        " ---------------------------------------------------------------------

        " Text is not wrapped, color column is not displayed
        autocmd FileType htmljinja setlocal nowrap
        autocmd FileType htmljinja setlocal colorcolumn=""

        " Autocommands for javascript files
        " ---------------------------------------------------------------------

        autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

        " Set the indentation to 2 columns
        autocmd FileType javascript setlocal tabstop=2
        autocmd FileType javascript setlocal shiftwidth=2
        autocmd FileType javascript setlocal softtabstop=2
    endif
endif
