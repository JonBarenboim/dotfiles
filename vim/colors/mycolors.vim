" Vim color file

set background=dark
if exists("syntax_on")
    syntax reset
endif

""" gui 
hi Normal           ctermfg=white   guifg=white   ctermbg=black              guibg=black 
hi Folded                                         ctermbg=gray30             guibg=gray30
hi FoldColumn       ctermfg=white   guifg=white   ctermbg=gray30             guibg=gray30
hi IncSearch                                      ctermbg=steelblue          guibg=steelblue
hi Search                                         ctermbg=lightslateblue     guibg=lightslateblue

" syntax
hi Comment          ctermfg=grey64
hi Todo             ctermfg=blue 
hi Constant         ctermfg=yellow2    
hi String           ctermfg=goldenrod2
hi Operator         ctermfg=OrangeRed
hi Statement        ctermfg=chocolate
hi Function         ctermfg=cyan2
hi Type             ctermfg=violet
hi Exception        ctermfg=green
hi Conditional      ctermfg=LightSkyBlue2
hi PreProc          ctermfg=magenta
hi Special          ctermfg=salmon
hi 

" links
hi link Character   String
hi link Float       Constant
hi link Number      Constant
hi link Include     PreProc
hi link Define      PreProc
hi link Macro       PreProc
hi link Structure   Type
hi link TypeDef     Type
hi link Boolean     Conditional
hi link Keyword     Statement


" Note:
" In Python link Delims ( ( ) [ ] { } ) to Special

"Bash
" shArithmetic -> Special       CHANGE TO       shArithmetic -> Operator
" shCharClass  -> Identifier
" shSnglCase -> Statement
" shCommandSub -> Special
" shConditional -> Conditional
"

" PYTHON - desert
" Function -> Identifier
" String -> Constant
" Constant -> term=underline ctermfg=3
" Operator -> Statment
" Statement -> term=bold ctermfg=3
" Identifier -> ctermfg=6
" Include -> PreProc
" PreProc -> ctermfg=5
" Contitional, Keyword -> Statement
" Escape -> Special
" Special -> ctermfg=5
" Folded -> cterm=bol, ctermfg=0 
