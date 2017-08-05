set mouse-=a
set et sw=4 ts=4
set rulerformat=%30(L=%l\ c=%c\ b=%v\ B=%o%)
syntax enable
filetype plugin indent on
execute pathogen#infect()
set bg=dark

let g:syntastic_python_flake8_args = '--max-line-length=120'
let g:syntastic_c_include_dirs = ['/usr/include/python2.7']

let g:syntastic_go_checkers = ['gometalinter']
let g:syntastic_go_gometalinter_args = "--fast -e 'exported .* should have comment or be unexported' -e 'declaration of \"err\" shadows declaration at' --exclude gocyclo"

let g:syntastic_pony_checkers = ['currycomb']

:au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
