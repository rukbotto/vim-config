" Improves vim's ability to detect filetype for Django template files.

if exists("g:htmldjango_disable_detection") && g:htmldjango_disable_detection
  finish
endif

" We will scan the first 50 lines to see if it looks like a valid Django
" template file and then switch over to the corresponding filetype.
function! s:TryDetectDjango()
    let n = 1
    let filetype = ""
    while n < 50 && n <= line("$")
        let line = getline(n)
        if line =~ '{[{%]'
            if line =~ '{%' || line =~ '{{'
                let filetype = "htmldjango"
            endif
            let &l:filetype = filetype
            return
        endif
        let n = n + 1
    endwhile
    if filetype == ""
        let &l:filetype = "html"
        return
    endif
endfunction

" Whenever the buffer finished writing we also try to upgrade to a valid
" Django template filetype. This can be separately disabled with
" g:htmldjango_disable_upgrade.
function! s:UpgradeToDjango()
    if exists("b:did_upgrade")
        return
    endif
    let b:did_upgrade = 1

    call s:TryDetectDjango()
endfunction

if has("autocmd")
    autocmd BufRead *.html,*.htm,*.shtml,*.stm call s:TryDetectDjango()
    if !exists("g:htmldjango_disable_upgrade") || !g:htmldjango_disable_upgrade
        autocmd BufWritePost *.html,*.htm,*.shtml,*.stm call s:UpgradeToDjango()
    endif
endif
