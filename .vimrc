set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'ervandew/supertab'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-scripts/Conque-GDB'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'jiangmiao/auto-pairs'

call vundle#end()

" omnicomplete viene chiamato con tab
let g:SuperTabDefaultCompletionType = "context"

" ctrlp da priorita` ai file nei progetti-git
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ['git-projects']
let g:ctrlp_cmd='CtrlPMixed'
let g:ctrlp_clear_cache_on_exit = 0

" auto matching di parentesi e apostrofi
"imap { {}<left>
"imap [ []<left>
"imap ( ()<left>
"imap  c<Esc><right>r"i
"imap ' 'c<Esc><right>r'i
" automatizza l aggiornamento delle tags. lancia vim nelle root del progetto
:command TagsUpd !ctags -R .
noremap <C-n> :TagsUpd <Enter>

" mette automaticamente ; alla fine
inoremap ;; <END>;

" corregge typo Wa in wa
:command Wa wa
:command W w

" automatizza wa e make
:command Mymake wa | make! | tab copen 
:command Mymakesimple wa | make! 
noremap \| :Mymake <Enter> 
noremap \ :Mymakesimple <Enter>

set t_Co=256
set term=screen-256color

colorscheme babymate256

filetype plugin indent on
filetype plugin on

" mappa frecce a nulle in normal mode
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" spostarsi fra windows dx sx con ctrl k/j
map <C-j> <C-W>h
map <C-k> <C-W>l
map <C-l> <C-W>k
map <C-h> <C-W>j

set omnifunc=syntaxcomplete#Complete
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
set relativenumber
set so=999                        "fa scrollare tenedo il cursore in mezzo
set colorcolumn=80
set wildmenu                      "menu di autocompl quando si apre buff :e <file>
set hidden                        "apri nuovo buffer senza dover salvare il corrente

set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class
set title

syntax on
