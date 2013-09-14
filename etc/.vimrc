"cd ~/.vim
"git clone https://github.com/kien/ctrlp.vim.git bundle/ctrlp.vim

let ctrlp_root_markers=['~/ws/matcher/']
set runtimepath^=~/.vim/bundle/ctrlp.vim
set number
set autoindent
set nowrap
set list listchars=tab:>-,trail:.,extends:>,precedes:<,nbsp:_
set tabstop=2
set shiftwidth=2
set wildignore+=*/target/*,*.class,*/.svn/*,*/.git/*
set nobackup
set noswapfile
"set paste
imap ;; <Esc>
syntax on
nnoremap <C-b> :CtrlP ~/ws/matcher/<cr>
nnoremap <C-e> :E ~/ws/matcher/<cr>
