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

" =============================================================================
" Variables
" =============================================================================

" Leader and local leader remappings
let mapleader=" "
let maplocalleader="\\"

" Plugin variables

" Syntastic variables
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_typescript_checkers = ['tslint']

" =============================================================================
" Settings
" =============================================================================

" Turn off bell
set belloff=all

" Insert spaces instead of tabs when indenting text
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Disable line wrapping
set nowrap

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

" Don't break words when wrapping lines
set linebreak

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
set list listchars=tab:›-,trail:-,extends:»,precedes:«

" Ignore the following dirs and files
set wildignore+=*/node_modules/*,.git/

" Make clipboard work with tmux
set clipboard=unnamed

" Status line
set statusline=
set statusline+=\ %0.40f
set statusline+=\ %m%r
set statusline+=\ %h%w
set statusline+=%=
set statusline+=\ %{SyntasticStatuslineFlag()}
set statusline+=\ %{FugitiveStatusline()}
set statusline+=\ %y
set statusline+=\ %4l/%-4L\ C%-3c
set statusline+=\ %P\ %*

" =============================================================================
" Normal mode mappings
" =============================================================================

" General mappings
nnoremap <Leader>src :source $MYVIMRC<CR>
nnoremap <Leader>erc :new $MYVIMRC<CR>
nnoremap <Leader>egrc :new $MYGVIMRC<CR>
nnoremap <Leader>elrc :new $HOME/.local.vimrc<CR>

" Session mappings
nnoremap <Leader>ss :Obsession!<CR>
nnoremap <Leader>lds :source Session.vim<CR>

" Window mappings
noremap <Leader>z <C-w>\|<C-w>_
noremap <Leader>x <C-w>=

" Tab mappings
noremap <Leader>> :tabmove+<CR>
noremap <Leader>< :tabmove-<CR>
noremap <Leader>tn :tabnew<CR>
noremap <Leader>tc :tabclose<CR>
noremap <Leader>to :tabonly<CR>
noremap <Leader>tr :terminal<Space>
noremap <Leader>vtr :vertical terminal<Space>

" Split mappings
nnoremap <Leader>n :new<CR>
nnoremap <Leader>vn :vnew<CR>

" Buffer mappings
nnoremap <Leader>o :Only<CR>

" Execute the string subtitution command
nnoremap <Leader>s :%substitute//

" Search for a pattern in current buffer
nnoremap / /\v

" Plugin mappings

" Conquer of completion
nmap <Leader>jd <Plug>(coc-definition)
nmap <Leader>jt <Plug>(coc-type-definition)
nmap <Leader>jl <Plug>(coc-declaration)
nmap <Leader>ji <Plug>(coc-implementation)
nmap <Leader>jr <Plug>(coc-references)
nmap <Leader>rn <Plug>(coc-rename)

" Fugitive
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gp :Git push<Space>
nnoremap <Leader>gpl :Git pull<Space>
nnoremap <Leader>gc :Git checkout<Space>
nnoremap <Leader>gb :Git branch<Space>
nnoremap <Leader>gbl :Gblame<CR>
nnoremap <Leader>gz :Git stash<Space>
nnoremap <Leader>gf :Git fetch<Space>
nnoremap <Leader>gl :Git log<Space>
nnoremap <Leader>gtg :Git tag<Space>
nnoremap <Leader>grs :Git reset<Space>

" FZF mappings
nnoremap <Leader><Space> :Files<CR>
nnoremap <Leader>rg :Rg<Space>
nnoremap <Leader>ag :Ag<Space>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>tg :Tags<CR>
nnoremap <Leader>cr :Colors<CR>
nnoremap <Leader>cm :Commands<CR>

" Syntastic
nnoremap <Leader>sc :SyntasticCheck<CR>

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

" Search the current visual selection
xnoremap * :<C-u> call <SID>SearchVisualSelection()<CR>/<C-r>=@/<CR><CR>

" Execute a macro inside a visual selection block
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

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

        " Autocommands for dockerfile files
        autocmd BufNewFile,BufRead *Dockerfile* set filetype=dockerfile

        " Autocommands for haskell files
        autocmd BufNewFile,BufRead *xmobarrc set filetype=haskell
        autocmd FileType haskell setlocal colorcolumn=80,120

        " Autocommands for haxe files
        autocmd FileType haxe setlocal autowrite
        autocmd FileType haxe setlocal tabstop=4
        autocmd FileType haxe setlocal shiftwidth=4
        autocmd FileType haxe setlocal softtabstop=4
        autocmd FileType haxe setlocal colorcolumn=80,120

        " Autocommands for javascript files
        autocmd FileType javascript setlocal colorcolumn=80,120

        " Autocommands for markdown files
        autocmd FileType markdown setlocal wrap
        autocmd FileType markdown setlocal linebreak

        " Autocommands for python files
        autocmd BufWritePre *.py :Autopep8
        autocmd FileType python setlocal tabstop=4
        autocmd FileType python setlocal shiftwidth=4
        autocmd FileType python setlocal softtabstop=4
        autocmd FileType python setlocal colorcolumn=80,120

        " Autocommands for shell files
        autocmd FileType sh setlocal tabstop=4
        autocmd FileType sh setlocal shiftwidth=4
        autocmd FileType sh setlocal softtabstop=4
        autocmd FileType sh setlocal noexpandtab

        " Autocommands for snippets files
        autocmd FileType snippets setlocal tabstop=4
        autocmd FileType snippets setlocal shiftwidth=4
        autocmd FileType snippets setlocal softtabstop=4
        autocmd FileType snippets setlocal noexpandtab

        " Autocommands for tmux config files
        autocmd BufNewFile,BufRead *tmux.conf set filetype=tmux

        " Autocommands for typescript files
        autocmd FileType typescript let $PATH .= ":./node_modules/.bin"
        autocmd FileType typescript setlocal commentstring=//\ %s
        autocmd FileType typescript setlocal colorcolumn=80,120

        " Autocommands for viml files
        autocmd FileType vim setlocal tabstop=4
        autocmd FileType vim setlocal shiftwidth=4
        autocmd FileType vim setlocal softtabstop=4

        " Autocommands for xdefaults files
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

function! ExecuteMacroOverVisualRange()
    echo "@".getcmdline()
    execute ":'<,'>normal @".nr2char(getchar())
endfunction

" =============================================================================
" Source local vimrc file
" =============================================================================

let g:local_vimrc = $HOME . "/.local.vimrc"
if filereadable(g:local_vimrc)
    exec "source " . g:local_vimrc
endif
