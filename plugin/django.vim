" Improving vim's ability to detect filetype for Django template files.
"
" If vim detected HTML, we will scan the first 50 lines to see if it looks
" like a Django template file and then switch over to htmldjango.

if exists("g:django_disable_detection") && g:django_disable_detection
  finish
endif

function! s:TryDetectDjango()
    if exists("b:did_django_autodetect")
        return
    endif
    let b:did_django_autodetect=1

    let n = 1
    while n < 50 && n < line("$")
        let line = getline(n)
        if line =~ '{%\s*\(extends\|load\|block\|if\|ifequal\|ifnotequal\|ifchanged\|for\|include\|trans\|url\)\>'
                \ || line =~ '{{\s*\S+[|(]'
            setlocal filetype=htmldjango
            return
        endif
        let n = n + 1
    endwhile
endfunction

autocmd FileType html call s:TryDetectDjango()
