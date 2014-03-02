"cd ~/.vim
""git clone https://github.com/kien/ctrlp.vim.git bundle/ctrlp.vim
""git clone https://github.com/scrooloose/nerdtree.git bundle/nerdtree

"""""SETTINGS
set encoding=utf8
set ffs=unix,dos
set incsearch
set ruler
set mouse=a
set wildmenu
set wildmode=list:longest,full
set autoread
set hlsearch
set number
set autoindent
"set nowrap
set wrap
set list listchars=tab:>-,trail:.,extends:>,precedes:<,nbsp:_
"set expandtab
set tabstop=4
set shiftwidth=4
set wildignore+=*/target/*,*.class,*/.svn/*,*/.git/*
set nobackup
set noswapfile
"set paste
"imap ;; <Esc>
"set cursorline
syntax on
filetype plugin indent on

""""""NAVIGATION
let ctrlp_root_markers=['~/ws/vu-lmax/']
set runtimepath^=~/.vim/bundle/ctrlp.vim
set runtimepath^=~/.vim/bundle/nerdtree
let g:NERDTreeDirArrows=0
nnoremap <C-p> :CtrlP ~/ws/vu-lmax/<cr>
nnoremap <C-e> :E ~/ws/vu-lmax/<cr>
map j gj
map k gk

nnoremap <C-h> <Esc>:vimgrep w **/*
" see search results : <Esc>:cw<cr>


""""""EDITING
imap <C-d> <Esc>ddi
