set mouse-=a
set et sw=4 ts=4
set rulerformat=%30(L=%l\ c=%c\ b=%v\ B=%o%)
syntax enable
filetype plugin indent on
execute pathogen#infect()

let g:syntastic_python_flake8_args = '--max-line-length=120'
