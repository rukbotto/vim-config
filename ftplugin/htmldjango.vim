" Matchit plugin for django template files.
"
" Thanks to Dave Hodder.
" http://www.vim.org/account/profile.php?user_id=9589
"
" Code taken from django.vim on vim.org site.
" http://www.vim.org/scripts/download_script.php?src_id=9805

" Only use this filetype plugin when no other was loaded.
if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

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
    \ '{%\s*if\s.*%}:{%\s*else\s*%}:{%\s*endif\s*%},' .
    \ '{%\s*ifequal\s.*%}:{%\s*else\s*%}:{%\s*endifequal\s*%},' .
    \ '{%\s*ifnotequal\s.*%}:{%\s*else\s*%}:{%\s*endifnotequal\s*%},' .
    \ '{%\s*ifchanged\s.*%}:{%\s*else\s*%}:{%\s*endifchanged\s*%},' .
    \ '{%\s*for\s.*%}:{%\s*endfor\s*%},' .
    \ '{%\s*with\s.*%}:{%\s*endwith\s*%},' .
    \ '{%\s*comment\s.*%}:{%\s*endcomment\s*%},' .
    \ '{%\s*block\s.*%}:{%\s*endblock\s*%},' .
    \ '{%\s*filter\s.*%}:{%\s*endfilter\s*%},' .
    \ '{%\s*spaceless\s.*%}:{%\s*endspaceless\s*%}'
endif

" Restore the saved compatibility options.
let &cpo = s:save_cpo
unlet s:save_cpo
