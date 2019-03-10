set nocompatible
syntax on
filetype plugin indent on

" Check if terminal supports truecolor
if $COLORTERM ==? "truecolor" && has("termguicolors")
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

" Use special unicode chars for displaying hidden tab chars, trail spaces and
" whitespace
set list listchars=tab:›-,trail:-,extends:»,precedes:«

" Make clipboard work with tmux
set clipboard=unnamed

" Leader and local leader remappings
let mapleader=","
let maplocalleader="\\"

" =============================================================================
" Normal mode mappings
" =============================================================================

" Window mappings
noremap <Leader>z <C-w>\|<C-w>_
noremap <Leader>x <C-w>=

" Tab mappings
noremap <Leader>> :tabmove+<CR>
noremap <Leader>< :tabmove-<CR>
noremap <Leader>tn :tabnew<CR>
noremap <Leader>tc :tabclose<CR>
noremap <Leader>to :tabonly<CR>
noremap <Leader>tr :terminal<CR>

" Split mappings
nnoremap <Leader>hn :new<CR>
nnoremap <Leader>vn :vnew<CR>

" Execute the string subtitution command
nnoremap <Leader>s :%substitute//

" Fuzzy find files
nnoremap <Leader><Space> :Files<CR>

" Fuzzy find buffers
nnoremap <Leader>b :Buffers<CR>

" Fuzzy find tags
nnoremap <Leader>tg :Tags<CR>
nnoremap <Leader>tb :TagbarOpen jf<CR>

" Search for a pattern in current buffer
nnoremap / /\v

" Navigate through linter errors
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" =============================================================================
" Insert mode mappings
" =============================================================================

" Disable arrow keys in insert mode
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

inoremap "" ""<left>
inoremap '' ''<left>
inoremap `` ``<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap [<CR> [<CR>]<ESC>O
inoremap [;<CR> [<CR>];<ESC>O
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" =============================================================================
" Visual mode mappings
" =============================================================================

" Search for a pattern in current buffer
vnoremap / /\v

" Search the current visual selection
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
set statusline+=\ %P\ %*

" =============================================================================
" Plugin settings
" =============================================================================

" Jinja settings
let g:htmljinja_disable_detection = 1

" Vaxe settings
let g:vaxe_enable_airline_defaults = 0

" FZF settings
let g:fzf_layout = { 'down': '~20%' }

" Signify settings
let g:signify_vcs_list = ['git', 'hg']

" Tagbar settings
let g:tagbar_autoclose = 1

" Autopep8 settings
let g:autopep8_max_line_length=79
let g:autopep8_disable_show_diff=1

" ALE settings
let g:ale_linters = { 'rust': ['rls', 'cargo', 'rustc'] }
let g:ale_rust_rustc_options = ''
let g:ale_set_highlights = 0

" rust.vim settings
let g:rustfmt_autosave = 1

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
        autocmd FileType c++,haxe,java,python,vim,sh setlocal tabstop=4
        autocmd FileType c++,haxe,java,python,vim,sh setlocal shiftwidth=4
        autocmd FileType c++,haxe,java,python,vim,sh setlocal softtabstop=4

        " Don't convert tab to spaces
        autocmd FileType sh setlocal noexpandtab

        " Set line wrapping on
        autocmd FileType markdown setlocal wrap
        autocmd FileType markdown setlocal linebreak

        " Set filetype for haskell files
        autocmd BufNewFile,BufRead *xmobarrc set filetype=haskell

        " Set filetype for xdefaults files
        autocmd BufNewFile,BufRead *Xresources set filetype=xdefaults

        " Set filetype for tmux files
        autocmd BufNewFile,BufRead *tmux.conf set filetype=tmux

        " Set filetype for Dockerfile files
        autocmd BufNewFile,BufRead *Dockerfile* set filetype=dockerfile

        " Automatically format Python files on save
        autocmd BufWritePre *.py :Autopep8
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
