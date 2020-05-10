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
export COMPILATION_RESULTS=/tmp/compile

export PATH=$BIN:$JAVA_HOME/bin:$ANT_HOME/bin:$MAVEN_HOME/bin:$PATH

##### ALIASES #####
alias cdw='cd $WORKSPACE'
alias cda='cd $APPS'
alias vimbash='vim ~/.bashrc && source ~/.bashrc'
alias tmux="TERM=xterm-256color tmux"
alias ff='find . -name'

##### DEV UTILS #####
test ! -d $BIN && mkdir -p $BIN
mkdir -p $COMPILATION_RESULTS
echo 'rm -Rf $COMPILATION_RESULTS/* && find src/ -name *.java | xargs javac -d $COMPILATION_RESULTS -cp `find lib -name *.jar | tr "\n" ":"`' > $BIN/vucompiler.java
echo 'for f in `find . -name "*.java"`; do echo "==> $f";grep -P "^import" $f | grep -o -P "[^.]+(?=;)" | grep -v "*" > /tmp/imports.txt; for im in `cat /tmp/imports.txt`; do if [ `grep -v -P "^import" $f | grep -P "[^\w\d$im[^\w\d]" | wc -l` -eq 0 ]; then echo "removing import for $im"; sed -i "/\.$im;$/d" $f; fi; done; done' > $BIN/vuorganizeimports.java
echo 'mvn install dependency:copy-dependencies -DoutputDirectory=lib' > $BIN/vucopyjarstolib.maven
find $BIN -type f | xargs chmod +x
#execute repetitively: watch -n 20 'gradle test 2>&1 | tail -n 40'
#curl get: curl -k "url" -X GET -G -d 'arg1=val1' -d 'arg2=val2'
#curl post: curl -k -v -X POST -d @- <<EOF <data> EOF
#output similar lines in files: comm -12 <(sort file1) <(sort file2)
#split stdin into chunks and pipe into parallel instances of application: seq 100 | parallel --pipe -n 20 cat
#copy stdout into 2 commands - mkfifo or: cat f.txt | tee >(wc -l > /tmp/linecount) | <some other command>
#exit when first command in pipe fails: set -o pipefail
#iterate over pipe status if any part failed: exitarray=("${PIPESTATUS[@]}") && for i in "${!exitarray[@]}" ; do exitCode="${exitarray[$i]}" ... done


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

##### XTERM #####
if [[ "$DISPLAY" != "" ]] ; then
    echo "xterm*font:     *-fixed-*-*-*-15-*" > ~/.Xresources
    xrdb -merge ~/.Xresources
    #setxkbmap -layout "us,ua" -variant "," -option "grp:alt_shift_toggle"
fi

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

##### CREATE NEW ENV #####
#sudo apt-get install vim git unzip
#ssh-keygen -t rsa -C "boiko.roman@gmail.com"
#mkdir ~/ws
#cd ~/ws
#git clone git@github.com:RomanBoiko/dotfiles.git
#rm ~/.bashrc
#ln -s ~/ws/dotfiles/.bashrc ~/.bashrc
#source ~/.bashrc

#sudo apt-get install curl wget libxml2-utils make g++
#sudo apt-get install eclipse-platform xfonts-terminus chromium-browser lua5.2 ctags
