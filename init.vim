call plug#begin('~/.nvim/plugged')

" Autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neoinclude.vim'
Plug 'zchee/deoplete-clang'
Plug 'zchee/deoplete-jedi'

" Latex
Plug 'donRaphaco/neotex', { 'for': 'tex' }

" Finding files, search
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'cloudhead/neovim-fuzzy'

" Colors and graphic
Plug 'mhartington/oceanic-next'
Plug 'vim-airline/vim-airline'

" Syntax
Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'
Plug 'valloric/MatchTagAlways', { 'autoload':{ 'filetypes':['html', 'xml', 'xhtml']}} " highlights opening and closing xhtml tags
Plug 'neomake/neomake'

" Git
Plug 'airblade/vim-gitgutter'

" Utils
Plug 'tpope/vim-surround'
Plug 'gorodinskiy/vim-coloresque', { 'autoload':{ 'filetypes':['css']}} " highlights colors properly

call plug#end()

" NERDTree config
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" deoplete autocompletion config
let g:deoplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : ""
let g:deoplete#sources#clang#libclang_path = "/usr/lib/libclang.so"
let g:deoplete#sources#clang#clang_header = "/usr/lib/clang"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" indentLine config, shows indentation char
let g:indentLine_char = '»'

" auto-pairs, closes brackets in insert mode
let g:AutoPairsFlyMode = 1 " jump after closing bracket by inserting closing bracket

" Colorscheme config
syntax enable
syntax on
let g:oceanic_next_terminal_bold = 1
colorscheme OceanicNext
set background=dark
hi CursorLineNR guifg=#ffffff
hi CursorLine guibg=Grey40 cterm=NONE guifg=NONE
hi Comment ctermfg=lightgray ctermbg=darkgray

" FZF fuzzy file search config
map <c-p> :FuzzyOpen<CR>

" Airline
let g:airline_theme='oceanicnext'

" Editor preferences
set nocompatible   " breaks Vi compability
filetype on        " recognize filetype when loaded
inoremap ;; <END>; 
:command Wa wa     " typo fix
:command W w
filetype plugin indent on
filetype plugin on

map <C-j> <C-W>h
map <C-k> <C-W>l
map <C-l> <C-W>k
map <C-h> <C-W>j

map J 5j
map K 5k
map L K

noremap ; :

set autoread
set nowrap
set cursorline
set expandtab
set tabstop=3
set softtabstop=3
set shiftwidth=3
set number
set relativenumber
set so=999
set colorcolumn=80
set wildmenu
set hidden

set wildignore=*.swp,*.bak,*.pyc,*.class
set title

set undofile
set undodir ="~/.VIM_UNDO_FILES"
