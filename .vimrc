set nocompatible
filetype off

set rtp+=~/.dotvim/bundle/Vundle.vim

call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree.git'
Plugin 'scrooloose/nerdcommenter.git'
Plugin 'wincent/Command-T'
Plugin 'tpope/vim-surround'
Plugin 'SirVer/ultisnips.git'
Plugin 'bling/vim-airline.git'
Plugin 'majutsushi/tagbar.git'
Plugin 'othree/html5.vim.git'
Plugin 'mattn/emmet-vim.git'
Plugin 'genoma/vim-less'
Plugin 'nelstrom/vim-qargs.git'
Plugin 'nathanaelkane/vim-indent-guides.git'
Plugin 'JulesWang/css.vim.git'
Plugin 'rukbotto/vim-django'
Plugin 'plasticboy/vim-markdown'

" Color schemes
Plugin 'tomasr/molokai'
Plugin 'git@bitbucket.org:rukbotto/smyck.vim.git'

call vundle#end()

syntax on
filetype plugin indent on

" Enable matchit macro
runtime macros/matchit.vim

" Set colorscheme
colorscheme smyck

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

" Display the help file for a given tag
nnoremap <Leader>h :help<Space>

" Reload current file
nnoremap <Leader>r :e %<CR>

" Save the current buffer
nnoremap <Leader>w :write<CR>

" Save all open buffers
nnoremap <Leader>wa :wall<CR>

" Save the current buffer to a new file
nnoremap <Leader>wn :write<Space>

" Quit the current window
nnoremap <Leader>q :quit<CR>
nnoremap <Leader>qf :quit!<CR>

" Quit all windows
nnoremap <Leader>qa :qall<CR>
nnoremap <Leader>qaf :qall!<CR>

" Open a new vertical split
nnoremap <Leader>vn :vnew<CR>

" Open a new horizontal split
nnoremap <Leader>nw :new<CR>

" Open a new tab
nnoremap <Leader>tn :tab :new<CR>

" Close the current tab
nnoremap <Leader>tc :tabclose<CR>

" Source the current buffer
nnoremap <Leader>so :source %<CR>

" Turn off search highlights
nnoremap <Leader><Space> :nohlsearch<CR>

" Execute the string subtitution command
nnoremap <Leader>s :%substitute//

" Toggle relative line numbers
nnoremap <Leader>n :set norelativenumber!<CR>

" Edit the given buffer
nnoremap <Leader>b :buffer<Space>

" Display the next buffer in buffer list
nnoremap <Leader>bn :bnext<CR>

" Display the previous buffer in buffer list
nnoremap <Leader>bp :bprevious<CR>

" Delete the current buffer
nnoremap <Leader>bd :bdelete<CR>

" Set spell checking in current buffer
nnoremap <Leader>sp :setlocal spell spelllang=

" Set filetype in current buffer
nnoremap <Leader>sf :setfiletype<Space>

nnoremap <Leader>qg :Qargs<CR>

" Execute the given command for each file in argument list
nnoremap <Leader>ad :argdo<Space>

" Search for a pattern in the given files
nnoremap <Leader>vg :vimgrep /

" Close the other windows
nnoremap <Leader>o :only<CR>

" Make all windows the same size
nnoremap <Leader>= <C-w>=

" Disable arrow keys in normal mode
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>

" Move cursor to other windows
nnoremap K <C-w>k
nnoremap J <C-w>j
nnoremap H <C-w>h
nnoremap L <C-w>l

" Scroll down by one page
nnoremap JJ <C-f>

" Scroll up by one page
nnoremap KK <C-b>

" Display the next tab in tab list
nnoremap <Tab> :tabnext<CR>

" Display the previous tab in tab list
nnoremap <S-Tab> :tabprevious<CR>

" Search for a pattern in current buffer
nnoremap / /\v

" Execute fuzzy finder
nnoremap <Leader>t :CommandT<CR>

" Display/hide file explorer
nnoremap <Leader>1 :NERDTreeToggle<CR>

" Edit the bookmarks file
nnoremap <Leader>ntf :e $HOME/.NERDTreeBookmarks<CR>

" Display/hide code symbols explorer
nnoremap <Leader>2 :TagbarToggle<CR>

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
" NERDTree settings
" =============================================================================

let NERDTreeIgnore = ['\.pyc$']
let NERDTreeQuitOnOpen = 1
let NERDTreeShowBookmarks = 1
let NERDTreeShowHidden = 1

" =============================================================================
" UltiSnips settings
" =============================================================================

let g:UltiSnipsExpandTrigger = "<C-h>"

" =============================================================================
" Airline settings
" =============================================================================

let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_theme = "wombat"

" =============================================================================
" Tagbar settings
" =============================================================================

let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1

" =============================================================================
" Indent-guides settings
" =============================================================================

let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 0
let g:indent_guides_space_guides = 1
let g:indent_guides_color_change_percent = 4
let g:indent_guides_default_mapping = 1

" =============================================================================
" Command-T settings
" =============================================================================

let g:CommandTWildIgnore = &wildignore . ",*.pyc,*.jpg,*.png"
let g:CommandTMaxFiles = 50000

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
        autocmd BufRead,BufNewFile *.md set filetype=markdown
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

        " Autocommands for javascript files
        " ---------------------------------------------------------------------

        autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

        " Set the indentation to 2 columns
        autocmd FileType javascript setlocal tabstop=2
        autocmd FileType javascript setlocal shiftwidth=2
        autocmd FileType javascript setlocal softtabstop=2
    endif
endif
