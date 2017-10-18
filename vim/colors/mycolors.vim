" Vim color file

set background=dark
if exists("syntax_on")
    syntax reset
endif

""" gui 
hi Normal           ctermfg=white   guifg=white   ctermbg=black              guibg=black 
hi NonText          ctermfg=white   guifg=white   ctermfg=black              guibg=black 
hi Folded                                         ctermbg=239                guibg=gray30
hi FoldColumn       ctermfg=white   guifg=white   ctermbg=239                guibg=gray30
hi IncSearch                                      ctermbg=67                 guibg=steelblue
hi Search                                         ctermbg=105                guibg=lightslateblue

" syntax
hi Comment          ctermfg=248                 guifg=Grey66
hi Todo             ctermfg=blue                guifg=blue
hi Constant         ctermfg=190                 guifg=Yellow2    
hi String           ctermfg=186                 guifg=LightGoldenrod2
hi Operator         ctermfg=202                 guifg=OrangeRed1
hi Statement        ctermfg=88                  guifg=DarkRed
hi Function         ctermfg=50                  guifg=cyan2
hi Type             ctermfg=177                 guifg=violet
hi Exception        ctermfg=green               guifg=green
hi Conditional      ctermfg=109                 guifg=LightSkyBlue3
hi PreProc          ctermfg=magenta             guifg=magenta
hi Special          ctermfg=209                 guifg=salmon1

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
