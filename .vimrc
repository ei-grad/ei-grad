set mouse-=a
set et sw=4 ts=4
set rulerformat=%30(L=%l\ c=%c\ b=%v\ B=%o%)
syntax enable
filetype plugin indent on
execute pathogen#infect()

let g:syntastic_python_flake8_args = '--max-line-length=120'
let g:syntastic_c_include_dirs = ['/usr/include/python2.7']

let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
" let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

:au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
