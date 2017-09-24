" Matchit plugin for mustache template files.

" Only use this filetype plugin when no other was loaded.
if exists("b:did_ftplugin")
    finish
endif
let b:did_ftplugin = 1

" Use HTML ftplugin.
runtime! ftplugin/html.vim

" Make sure the continuation lines below do not cause problems in
" compatibility mode.
let s:save_cpo = &cpo
set cpo-=C

if exists("loaded_matchit")
    let b:match_ignorecase = 1
    let b:match_skip = 's:Comment'
    let b:match_words = '<:>,' .
    \ '<\@<=[ou]l\>[^>]*\%(>\|$\):<\@<=li\>:<\@<=/[ou]l>,' .
    \ '<\@<=dl\>[^>]*\%(>\|$\):<\@<=d[td]\>:<\@<=/dl>,' .
    \ '<\@<=\([^/][^ \t>]*\)[^>]*\%(>\|$\):<\@<=/\1>,'  .
    \ '{{:}},' . '{{{:}}},' .
    \ '{{#\s*\S\+\s*}}:{{/\s*\S\+\s*}},' .
    \ '{{^\s*\S\+\s*}}:{{/\s*\S\+\s*}},'
endif

" Restore the saved compatibility options.
let &cpo = s:save_cpo
unlet s:save_cpo
