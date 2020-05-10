function parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export PS1='\[\e[32m\]\u@\h \A \[\e[33m\]\w\[\e[0m\] $(parse_git_branch)\n$'
export HISTCONTROL="ignoredups"
export XMLLINT_INDENT=$'\t'

export BIN=~/bin
export APPS=$BIN/apps
export WORKSPACE=~/ws

export EDITOR='/usr/bin/vim'
export MAVEN_OPTS=''
export JAVA_HOME=$APPS/jdk
export MAVEN_HOME=$APPS/maven
export M2_HOME=$MAVEN_HOME
export ANT_HOME=$APPS/ant

export PATH=$BIN:$JAVA_HOME/bin:$ANT_HOME/bin:$MAVEN_HOME/bin:$PATH

##### ALIASES #####
alias cdw='cd $WORKSPACE'
alias cda='cd $APPS'
alias vimbash='vim ~/.bashrc && source ~/.bashrc'
alias tmux="TERM=xterm-256color tmux"
alias ff='find . -name'


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
alias gitdc="git diff --cached"
alias gitco="git checkout"
alias gitb="git branch"
alias gitst="git status"
alias gitci="git commit"
alias gitup="git checkout master; git fetch origin; git pull origin master"
alias gitpushm="git push origin master"
alias gitpush="git push origin "

##### SCREEN #####
echo "vbell off" > ~/.screenrc
echo "hardstatus on" >> ~/.screenrc
echo "startup_message off" >> ~/.screenrc
echo "hardstatus alwayslastline" >> ~/.screenrc
echo "hardstatus string ' %w %-017=%Y-%m-%d %c'" >> ~/.screenrc
## C-a S   - split horizontally
## C-a tab - jump to next display region
## C-a X   - close split

##### INPUTRC #####
echo "set bell-style none" > ~/.inputrc


##### VIM #####
mkdir -p ~/.vim/colors
echo 'let g:colors_name = "vuvimcolors"' > ~/.vim/colors/vuvimcolors.vim

cat <<'EOF' > ~/.vimrc
"""""SETTINGS
set t_Co=256
set term=xterm

set encoding=utf8
set ffs=unix,dos
set incsearch
set ruler
set mouse=a
set wildmenu
set wildignore+=*/target/*,*/classes/*,*/.class,*/.svn/*,*/.git/*,
set wildmode=list:longest,full
set wildignorecase

set autoread
set hlsearch
set number
set autoindent
set cindent
set nospell
set nowrap
"set wrap
set list listchars=tab:>-,trail:.,extends:>,precedes:<,nbsp:_
"set expandtab
set noexpandtab
set tabstop=4
set shiftwidth=4
set noswapfile
set nobackup
"set paste
set nopaste
"imap ;; <Esc>
syntax off
filetype plugin indent on

"stop word on underscore
set iskeyword-=_

nnoremap <C-e> :E ./<cr>
map j gj
map k gk

nnoremap <C-h> <Esc>:vimgrep  **/*<Left><Left><Left><Left><Left>
nnoremap <C-l> <Esc>:vimgrep <c-r>" **/*<cr><Esc>:cw<cr>
nnoremap <C-p> <Esc>:e **/

" see search results : <Esc>:cw<cr>
" next occurance: :cn


""""""EDITING
"moving selected block in visual mode
vnoremap K xkP\`[V\`]
vnoremap J xp\`[V\`]
vnoremap L >gv
vnoremap H <gv

nnoremap <Space> @q
nnoremap <Leader>s :update<cr>

set makeprg=vucompiler.java
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
map <F2> :make<Return>:copen<Return>
map <F3> :cnext<Return>
map <F4> :cprevious<Return>
map <F5> :cclose<Return>

hi clear
set cursorline
hi CursorLine cterm=bold
hi StatusLine ctermfg=white ctermbg=darkgray cterm=NONE
hi MatchParen ctermfg=white ctermbg=red cterm=none
hi LineNr ctermfg=darkgrey ctermbg=darkgrey
hi Search term=reverse ctermfg=white ctermbg=red
hi Comment term=bold cterm=bold ctermfg=0 gui=none guifg=DarkGray
hi String term=none cterm=none ctermfg=3 gui=none guifg=LightYellow
hi Statement term=bold cterm=bold ctermfg=7 gui=bold guifg=White
hi link Keyword Statement
colorscheme vuvimcolors

iabbrev syso System.out.println("");<LEFT><LEFT><LEFT>
iabbrev pub public void () {<CR><CR>}<UP>
EOF
