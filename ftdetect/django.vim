" Improves vim's ability to detect filetype for HTML template files.

if exists("g:htmltemplate_disable_detection") && g:htmltemplate_disable_detection
  finish
endif

" We will scan the first 50 lines to see if it looks like a valid HTML
" template file and then switch over to the corresponding filetype.
function! s:TryDetectHTMLTemplate()
    let n = 1
    while n < 50 && n <= line("$")
        let line = getline(n)
        let filetype = ''
        if line =~ '{[{%]'
            if line =~ '{%\s*\(extends\|load\|block\|if\|ifequal\|ifnotequal\|ifchanged\|for\|include\|trans\|url\)\>' || line =~ '{{\s*\S\+'
                let filetype = 'htmldjango'
            endif
            if line =~ '{{[#^>{]\s*\S\+'
                let filetype = 'htmlmustache'
            endif
            let &l:filetype = filetype
            return
        endif
        let n = n + 1
    endwhile
endfunction

" Whenever the buffer finished writing we also try to upgrade to a valid
" HTML template filetype. This can be separately disabled with
" g:htmltemplate_disable_upgrade.
function! s:UpgradeToHTMLTemplate()
    if exists("b:did_html_upgrade")
        return
    endif
    let b:did_html_upgrade = 1

    call s:TryDetectHTMLTemplate()
endfunction

autocmd BufRead *.html,*.htm,*.shtml,*.stm,*.mustache call s:TryDetectHTMLTemplate()
if !exists("g:htmltemplate_disable_upgrade") || !g:htmltemplate_disable_upgrade
    autocmd BufWritePost *.html,*.htm,*.shtml,*.stm,*.mustache call s:UpgradeToHTMLTemplate()
endif
