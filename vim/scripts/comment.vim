" comment from current line to given line number
" Ex. if on line 6 8<leader>c comments lines 6,7,8
" Works backwards too. 4<leader>c comments lins 4,5,6
nmap <leader>c :<C-u>call Comment(v:count1)<CR>
"uncomment from current line to given line number
nmap <leader>u :<C-u>call UnComment(v:count1)<CR>

function! Comment(toline)
    if a:toline > line('.')
        execute ".," . a:toline . "s/^/" . b:commentChar . " "
    else 
        execute a:toline . ",.s/^/" . b:commentChar . " "
    endif
endfunction

function! UnComment(toline)
    if a:toline > line('.')
        execute ".," . a:toline . "s/^" . b:commentChar . " /"
    else 
        execute a:toline . ",.s/^" . b:commentChar . " /"
    endif
endfunction

" set comment character when buffer is loaded of filetype is set
autocmd BufEnter,BufRead,Filetype * :call SetCommentChar(&filetype)

function! SetCommentChar(filetype)
    if has_key(s:languageCommentMap, a:filetype)
        let b:commentChar = s:languageCommentMap[a:filetype]
    else
        let b:commentChar = ''
    endif
endfunction

" Define comment character for comment file types
" Note: forward slashes must be escaped
let s:languageCommentMap = {
    \ 'awk' : '#',
    \ 'c' : '\/\/',
    \ 'dosini' : ';',
    \ 'groovy' : '\/\/',
    \ 'java' : '\/\/', 
    \ 'javascript' : '\/\/',
    \ 'matlab' : '%',
    \ 'octave' : '%',
    \ 'python' : '#',
    \ 'r' : '#',
    \ 'sh' : '#',
    \ 'sql' : '--',
    \ 'vim' : '"'
    \ }

