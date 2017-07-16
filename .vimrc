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
Plugin 'vim-syntastic/syntastic'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
Plugin 'ludovicchabant/vim-lawrencium'
Plugin 'majutsushi/tagbar'
Plugin 'flazz/vim-colorschemes'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'tpope/vim-obsession'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'tpope/vim-vinegar'
Plugin 'ChesleyTan/wordCount.vim'

call vundle#end()

syntax on
filetype plugin indent on

" Enable matchit macro
runtime macros/matchit.vim

" Insert spaces instead of tabs when indenting text
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

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

" Cursor will be 8 lines away from top/down edges when scrolling
set scrolloff=8

" Line numbers are relative to the current line
set relativenumber

" Use special unicode chars for displaying hidden tab chars, trail spaces and
" whitespace
set list listchars=tab:‣\ ,trail:∙,extends:»,precedes:«

" Make clipboard work with tmux
set clipboard=unnamed

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

" Execute the string subtitution command
nnoremap <Leader>s :%substitute//

" Open tagbar window
nnoremap tag :TagbarOpen fjc<CR>

" Fuzzy find files
nnoremap <Leader><Space> :Files<CR>

" Fuzzy find buffers
nnoremap <Leader>b :Buffers<CR>

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
" Status line
" =============================================================================

set statusline=
set statusline+=%0.40f
set statusline+=\ %m%r
set statusline+=\ %h%w
set statusline+=\ %{StatusLineBranchName()}
set statusline+=%=%y
set statusline+=\ %l/%L:C%c
set statusline+=\ %P
set statusline+=\ %{SyntasticStatuslineFlag()}

" =============================================================================
" Plugin settings
" =============================================================================

" UltiSnips settings
let g:UltiSnipsExpandTrigger = "<C-h>"

" Markdown settings
let g:markdown_fenced_languages = ['c', 'cpp', 'css', 'haxe', 'html', 'java',
      \ 'javascript', 'python', 'ruby', 'sass', 'scss']

" Jinja settings
let g:htmljinja_disable_detection = 1

" Vaxe settings
let g:vaxe_enable_airline_defaults = 0

" FZF settings
let g:fzf_layout = { 'down': '~20%' }

" Syntastic settings
let g:syntastic_html_checkers = [""]
let g:syntastic_stl_format = "[%E{E:%fe #%e}%B{, }%W{W:%fw #%w}]"

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

        " Highlight text when line length is beyond 80 chars for selected
        " filetypes
        autocmd FileType * match none
        autocmd FileType c++,haxe,java,javascript,markdown,python,ruby,vim
                    \ match WarningMsg '\%>80v.\+'

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

        " Set statusline
        autocmd FileType markdown setlocal statusline+=\ %{StatusLineWordCount()}
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

" Print Git/Mercurial branch name on statusline
function! StatusLineBranchName()
    let l:branch = ""
    if exists('*fugitive#head')
        let l:branch = fugitive#head()
    endif
    if !strlen(l:branch) && exists('*lawrencium#statusline')
        let l:branch = lawrencium#statusline()
    endif
    if strlen(l:branch)
        return "[" . l:branch . "]"
    endif
    return l:branch
endfunction

" Print word count on statusline
function! StatusLineWordCount()
  let l:wordcount = ""
  if exists('*wordCount#WordCount')
    let l:wordcount = wordCount#WordCount()
  endif
  if l:wordcount
    return "[" . l:wordcount . " words]"
  else
    return ""
  endif
endfunction

" =============================================================================
" Source local vimrc file
" =============================================================================

if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif
