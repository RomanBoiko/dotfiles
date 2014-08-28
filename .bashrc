function parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}


export PS1='\[\e[32m\]\u@\h \A \[\e[33m\]\w\[\e[0m\] $(parse_git_branch)\n$'
#setxkbmap -layout "us,ua" -variant "," -option "grp:alt_shift_toggle"
export HISTCONTROL="ignoredups"
export XMLLINT_INDENT=$'\t'

export APPS=/home/vu/apps
export WORKSPACE=/home/vu/ws
export ECLIPSE=/usr/bin/eclipse
alias e='$ECLIPSE --launcher.openFile'

alias cdw='cd $WORKSPACE'
alias cda='cd $APPS'
alias h='history | grep '
alias ec='vim ~/.bashrc'
alias mc='mc -b'

export EDITOR='/usr/bin/vim'
export MAVEN_OPTS=''
export JAVA_HOME=/usr/lib/jvm/java-6-openjdk-armhf
export MAVEN_HOME=$APPS/maven
export M2_HOME=$MAVEN_HOME
export ANT_HOME=$APPS/ant

export PATH=~/bin:$JAVA_HOME/bin:$ANT_HOME/bin:$MAVEN_HOME/bin:$PATH

##### SVN #####
alias svnd='svn diff'
alias svnl='svn changelist tc'
alias svnci='svn ci --cl tc -m'
alias svnre='svn revert '

##### GIT #####
echo '[user]'                           > ~/.gitconfig
echo 'name = boikoro'                  >> ~/.gitconfig
echo 'email = boiko.roman@gmail.com'   >> ~/.gitconfig
echo '[color]'                         >> ~/.gitconfig
echo 'ui = auto'                       >> ~/.gitconfig

alias gitd="git diff"
alias gitco="git checkout"
alias gitb="git branch"
alias gitst="git status"
alias gitci="git commit"
alias gitup="git checkout master; git fetch origin; git pull origin master"

function vimrc()
{
cat <<EOF
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

"moving selected block in visual mode
vnoremap K xkP\`[V\`]
vnoremap J xp\`[V\`]
vnoremap L >gv
vnoremap H <gv
EOF
}
vimrc > ~/.vimrc

source /etc/bash_completion.d/git
