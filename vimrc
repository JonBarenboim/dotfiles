set nocompatible

syntax on
filetype plugin indent on
	
set nobackup
set noswapfile

set runtimepath^=~/.vim/bundle/vim-airline/
set runtimepath^=~/.vim/bundle/vim-airline-themes/
set runtimepath^=~/.vim/bundle/vim-fugitive/
set runtimepath^=~/.vim/bundle/vim-bbye/

set laststatus=2 "always show status bar
set number "show line numbers
set showcmd "show command as it is being typed
set wildmenu "visual tab completion for files and commands
set showmatch "show maching bracket, quatation, etc
set mouse=a
set nostartofline "don't return cursor to first column when switching lines
set scrolloff=3 "always leave 3 lines below and above cursor

"turn off bell
set visualbell 
set t_vb=

"different theme for bash files
autocmd BufReadPre * colorscheme desert
autocmd FileType sh colorscheme ron
autocmd FileType sh highlight Comment ctermfg=grey
autocmd FileType * highlight LineNr ctermbg=8 ctermfg=white
autocmd BufEnter * :AirlineRefresh

nnoremap j gj
nnoremap k gk

"show full path of file
nnoremap <C-G> 1<C-G> 

" page up
nnoremap <C-K> <C-B> 
" page odwn
nnoremap <C-J> <C-F>
" move up half page
nnoremap <S-J> <C-U>
" move down half page
nnoremap <S-K> <C-D>
" beginning and end of line
nnoremap <C-H> 0
nnoremap <C-L> $


let mapleader=','
nmap <leader>n :bn <CR>
nmap <leader>b :bp <CR>
nmap <leader>q :Bdelete <CR>

set tabstop=4
set shiftwidth=4
set expandtab

"air-line
let g:airline_powerline_fonts = 1
set noshowmode

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
    endif

    " unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline_detect_modified = 1
let g:airline#extensions#branch#format = 0
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#buffer_nr_show = 1
set ttimeoutlen=50
