function parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export PS1='\[\e[32m\]\u@\h \A \[\e[33m\]\w\[\e[0m\] $(parse_git_branch)\n$'
#setxkbmap -layout "us,ua" -variant "," -option "grp:alt_shift_toggle"
export HISTCONTROL="ignoredups"
export XMLLINT_INDENT=$'\t'

export APPS=~/apps
export BIN=~/bin
export WORKSPACE=~/ws
export ECLIPSE=/usr/bin/eclipse

alias e='$ECLIPSE --launcher.openFile'
alias cdw='cd $WORKSPACE'
alias cda='cd $APPS'
alias vimbash='vim ~/.bashrc && source ~/.bashrc'
alias mc='mc -b'
alias xmlf="xmllint --format"
alias ctagsgen="ctags --langmap=Lisp:+.clj --fields=+iaS --extra=+q -R ."

export EDITOR='/usr/bin/vim'
export MAVEN_OPTS=''
export JAVA_HOME=$APPS/jdk
export MAVEN_HOME=$APPS/maven
export M2_HOME=$MAVEN_HOME
export ANT_HOME=$APPS/ant

export PATH=$BIN:$JAVA_HOME/bin:$ANT_HOME/bin:$MAVEN_HOME/bin:$PATH

##### SVN #####
alias svnd='svn diff'
alias svnl='svn changelist tc'
alias svnci='svn ci --cl tc -m'
alias svnre='svn revert '

##### GIT #####
echo '[user]'                           > ~/.gitconfig
echo 'name = RomanBoiko'               >> ~/.gitconfig
echo 'email = boiko.roman@gmail.com'   >> ~/.gitconfig
echo '[color]'                         >> ~/.gitconfig
echo 'ui = auto'                       >> ~/.gitconfig

alias gitd="git diff"
alias gitco="git checkout"
alias gitb="git branch"
alias gitst="git status"
alias gitci="git commit"
alias gitup="git checkout master; git fetch origin; git pull origin master"
alias gitpushm="git push origin master"

source /etc/bash_completion.d/git

##### SCREEN #####
echo "vbell off" > ~/.screenrc
echo "hardstatus on" >> ~/.screenrc
echo "startup_message off" >> ~/.screenrc
echo "hardstatus alwayslastline" >> ~/.screenrc
echo "hardstatus string ' %w %-017=%Y-%m-%d %c'" >> ~/.screenrc

##### XTERM #####
echo "xterm*font:     *-fixed-*-*-*-15-*" > ~/.Xresources
xrdb -merge ~/.Xresources

##### VIM #####
cat <<'EOF' > ~/.vimrc
"cd ~/.vim
""git clone https://github.com/kien/ctrlp.vim.git bundle/ctrlp.vim
""git clone https://github.com/scrooloose/nerdtree.git bundle/nerdtree

"""""SETTINGS
set t_Co=256
set term=xterm

set encoding=utf8
set ffs=unix,dos
set incsearch
set ruler
set mouse=a
set wildmenu
"set wildmode=list:longest,full
set autoread
set hlsearch
set number
set autoindent
set cindent
set nospell
set nowrap
"set wrap
set list listchars=tab:>-,trail:.,extends:>,precedes:<,nbsp:_
set expandtab
set tabstop=4
set shiftwidth=4
set noswapfile
set wildignore+=*/target/*,*.class,*/.svn/*,*/.git/*
set nobackup
"set paste
"imap ;; <Esc>
syntax on
filetype plugin indent on

""""""NAVIGATION
"let ctrlp_root_markers=['~/ws/']
"set runtimepath^=~/.vim/bundle/ctrlp.vim
"nnoremap <C-p> :CtrlP ./<cr>

set runtimepath^=~/.vim/bundle/nerdtree
let g:NERDTreeDirArrows=0
let g:NERDTreeWinSize=50

nnoremap <C-e> :E ./<cr>
map j gj
map k gk

nnoremap <C-h> <Esc>:vimgrep  **/*<Left><Left><Left><Left><Left>
nnoremap <C-l> <Esc>:vimgrep <c-r>" **/*<cr><Esc>:cw<cr>
nnoremap <C-p> <Esc>:e **/
" see search results: <Esc>:cw<cr>
" next occurance: :cn

" see search results : <Esc>:cw<cr>
" next occurance: :cn


""""""EDITING
" imap <C-d> <Esc>ddi

"moving selected block in visual mode
vnoremap K xkP\`[V\`]
vnoremap J xp\`[V\`]
vnoremap L >gv
vnoremap H <gv

nnoremap <Space> @q
nnoremap <Leader>s :update<cr>

set makeprg=javac.sh
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
map <F2> :make<Return>:copen<Return>
map <F3> :cnext<Return>
map <F4> :cprevious<Return>
map <F5> :cclose<Return>

colorscheme less
set cursorline
hi CursorLine cterm=bold
hi StatusLine ctermfg=white ctermbg=darkgray cterm=NONE
hi MatchParen ctermfg=white ctermbg=red cterm=none
hi LineNr ctermfg=darkgrey ctermbg=darkgrey
hi Search term=reverse ctermfg=white ctermbg=red
EOF

# watch -n 20 'gradle test 2>&1 | tail -n 40'
