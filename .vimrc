ab (A (Afficher
" /usr/share/vim/vim72/colors/README.txt
set nocompatible
"set pastetoggle=<F11>
" set columns=80
set colorcolumn=80
highlight ColorColumn ctermbg=4
set ruler
set softtabstop=4
set expandtab
set tabstop=4
set encoding=utf-8
" size of >> << (not to be confused with tab-size)
set shiftwidth=4
set autoindent
filetype plugin indent on
set foldmethod=indent
set foldlevelstart=20
set number
syntax on
set statusline=%F

set backup
set swapfile
set backupdir=~/.vim-tmp
set directory=~/.vim-tmp

inoremap vd <esc>
inoremap <esc> <nop>
let mapleader = "\<Space>"

map OA <up>
map OB <down>
map OC <right>
map OD <left>

" http://vim.wikia.com/wiki/Keep_folds_closed_while_inserting_text
" Don't screw up folds when inserting text that might affect them, until
" leaving insert mode. Foldmethod is local to the window.
autocmd InsertEnter * let w:last_fdm=&foldmethod | setlocal foldmethod=manual
autocmd InsertLeave * let &l:foldmethod=w:last_fdm

if !empty(system("setxkbmap -print|grep bepo"))
    source $HOME/.bepo.vim
endif

let g:lisp_rainbow = 1
" Les opérateurs +-*/><= doivent rester blancs.
hi def lispFunc   ctermfg=grey
" Les textes en vert discret.
hi def lispString ctermfg=darkgreen
" Les parenthèses.
hi def hlLevel0   ctermfg=darkred
hi def hlLevel1   ctermfg=brown
hi def hlLevel2   ctermfg=yellow
hi def hlLevel3   ctermfg=green
hi def hlLevel4   ctermfg=cyan
hi def hlLevel5   ctermfg=blue
hi def hlLevel6   ctermfg=darkmagenta
hi def hlLevel7   ctermfg=darkred

function! Panneaux()
    " :call Panneaux()
    " delete lines containing
    for pattern in ["ele", "time", "sat"]
        execute 'g/'.escape(pattern, '/').'/d'
    endfor

    " delete these strings
    for pattern in ["<!\\\[CDATA\\\[", "\]\]>"]
        try
            execute '%s/'.escape(pattern, '/').'//g'
        endtry
    endfor
endfunction
