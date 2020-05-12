call plug#begin('~/.config/nvim/nvim/plugged')

Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'

Plug 'easymotion/vim-easymotion'
Plug 'ervandew/supertab'
Plug 'donRaphaco/neotex', { 'for': 'tex' }

call plug#end()

" Easymotion
" space in normal mode activates jump between words
nmap <Space> <Plug>(easymotion-overwin-w)
" target keys are uppercase but lowercase input is fine
let g:EasyMotion_use_upper = 1
let g:EasyMotion_keys = 'ASDFGHJKLWERIOVN'

" hybrid relative line numbers
set number relativenumber
set nu nu

" omni completion
filetype plugin on
set omnifunc=syntaxcomplete#Complete
set completefunc=syntaxcomplete#Complete
 
" supertab
let g:SuperTabDefaultCompletionType = "<c-x><c-n>"
" auto close preview window
let g:SuperTabClosePreviewOnPopupClose = 1

" scrolling offset (centra il cursore verticalmente)
set so=9999

" search files in subdirectories
" and also provide tab-completion and fuzzy match with *
set path+=**
set wildmenu

" indentLine config, shows indentation char
let g:indentLine_char = '»'

" auto-pairs, closes brackets in insert mode
let g:AutoPairsFlyMode = 1 " jump after closing bracket by inserting closing bracket

" Colorscheme config
syntax enable
syntax on
set background=dark
hi CursorLineNR guifg=#ffffff
hi CursorLine guibg=Grey40 cterm=NONE guifg=NONE
hi Comment ctermfg=lightgray ctermbg=darkgray

" Editor preferences
set nocompatible   " breaks Vi compability
filetype on        " recognize filetype when loaded
:command Wa wa     " typo fix
:command W w
filetype plugin indent on
filetype plugin on

set autoread
set nowrap
set cursorline
set expandtab
set tabstop=3
set softtabstop=3
set shiftwidth=3
set number
set relativenumber
set colorcolumn=80
set wildmenu
set hidden

set wildignore=*.swp,*.bak,*.pyc,*.class
set title

set undofile
set undodir ="~/.VIM_UNDO_FILES"







