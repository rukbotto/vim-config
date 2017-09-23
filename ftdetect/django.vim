" Improves vim's ability to detect filetype for Django template files.

if exists("g:htmldjango_disable_detection") && g:htmldjango_disable_detection
  finish
endif

" We will scan the first 50 lines to see if it looks like a Django template
" file and then switch over to htmldjango.
function! s:TryDetectDjango()
    let n = 1
    while n < 50 && n < line("$")
        let line = getline(n)
        if line =~ '{%\s*\(extends\|load\|block\|if\|ifequal\|ifnotequal\|ifchanged\|for\|include\|trans\|url\)\>' || line =~ '{{\s*\S\+'
            setlocal filetype=htmldjango
            return
        endif
        let n = n + 1
    endwhile
endfunction

" Whenever the buffer finished writing we also try to upgrade to htmldjango.
" This can be separately disabled with g:htmldjango_disable_upgrade.
function! s:UpgradeToDjango()
    if exists("b:did_django_upgrade")
        return
    endif
    let b:did_django_upgrade = 1

    call s:TryDetectDjango()
endfunction

autocmd BufRead *.html call s:TryDetectDjango()
if !exists("g:htmldjango_disable_upgrade") || !g:htmldjango_disable_upgrade
    autocmd BufWritePost *.html,*.htm,*.shtml,*.stm call s:UpgradeToDjango()
endif
