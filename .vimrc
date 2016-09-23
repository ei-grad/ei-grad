set mouse-=a
set et sw=4 ts=4
syntax enable
filetype plugin indent on
execute pathogen#infect()

let g:syntastic_python_flake8_args = '--max-line-length=120'
