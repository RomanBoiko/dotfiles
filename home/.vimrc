"cd ~/.vim
"git clone https://github.com/kien/ctrlp.vim.git bundle/ctrlp.vim

let ctrlp_root_markers=['~/ws/']
set runtimepath^=~/.vim/bundle/ctrlp.vim
set number
set autoindent
set nowrap
set list listchars=tab:>-,trail:.,extends:>,precedes:<,nbsp:_
set tabstop=2
set shiftwidth=2
set expandtab
set wildignore+=*/target/*,*.class,*/.svn/*,*/.git/*
set nobackup
set noswapfile
set hlsearch
"set paste
imap ;; <Esc>
syntax on
nnoremap <C-b> :CtrlP ~/ws/<cr>
nnoremap <C-e> :E ~/ws/<cr>
