set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'jeaye/color_coded'
Plugin 'vim-scripts/Conque-GDB'
Plugin 'L9'
Plugin 'Valloric/YouCompleteMe'
Plugin 'myusuf3/numbers.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'flazz/vim-colorschemes'

call vundle#end()

" corregge typo Wa in wa
:command Wa wa
:command W w

" automatizza wa e make
:command Mymake wa | make! | tab copen
noremap \ :Mymake <Enter> 

let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'  
let g:ycm_show_diagnostic_ui = 0
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0

set t_Co=256
set term=screen-256color

colorscheme babymate256

filetype plugin indent on

" mappa frecce a nulle in normal mode
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

set pastetoggle =<C-v>
set nowrap                        "non fa andare a capo ma continua sulla stessa riga
set backspace=indent,eol,start    "mi sa che permette di cancellare tutto
set expandtab   
set showmatch                     "illumina le parentesi corrispondenti
set tabstop=3                     "un tab equivale a 4 spazi
set softtabstop=3
set shiftwidth=3                  "numero di spazi usati per l' autoindentazione
set autoindent                    "autoindenta quando vai a capo
set copyindent                    "copia la indentazione precente
set number                        "mostra il numero della riga
set textwidth=80
set so=999                        "fa scrollare tenedo il cursore in mezzo

set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class
set title

syntax on

let g:airline#extension#tabline#enabled = 1  "fa vedere la airline anche in split
let g:airline_powerline_fonts = 1            "corregge le linee della airline
set laststatus =2                            "fa vedere la airline anche in un singolo file

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

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
