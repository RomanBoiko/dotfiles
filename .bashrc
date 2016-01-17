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
alias cdb='cd $BIN'
alias cda='cd $APPS'
alias vimbash='vim ~/.bashrc && source ~/.bashrc'
alias mc='mc -b'
alias xmlf="xmllint --format"
alias ctagsgen="ctags --langmap=Lisp:+.clj --fields=+iaS --extra=+q -R ."
alias vursync="rsync -avhzcP --del --exclude=.svn/ --filter 'protect .svn/' "


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
alias gitpush="git push origin "

GCOMPLETION=/etc/bash_completion.d/git && test -f $GCOMPLETION && source $GCOMPLETION

##### SCREEN #####
echo "vbell off" > ~/.screenrc
echo "hardstatus on" >> ~/.screenrc
echo "startup_message off" >> ~/.screenrc
echo "hardstatus alwayslastline" >> ~/.screenrc
echo "hardstatus string ' %w %-017=%Y-%m-%d %c'" >> ~/.screenrc

##### INPUTRC #####
echo "set bell-style none" > ~/.inputrc

##### XTERM #####
if [[ "$DISPLAY" != "" ]] ; then
    echo "xterm*font:     *-fixed-*-*-*-15-*" > ~/.Xresources
    xrdb -merge ~/.Xresources
    #setxkbmap -layout "us,ua" -variant "," -option "grp:alt_shift_toggle"
fi


##### DEV UTILS #####
test ! -d $BIN && mkdir -p $BIN
echo 'find src/ -name *.java | xargs javac -d /tmp/javac -cp `find lib -name *.jar | tr "\n" ":"`' > $BIN/vucompiler.java
echo 'for f in `find . -name "*.java"`; do echo "==> $f";grep -P "^import" $f | grep -o -P "[^.]+(?=;)" | grep -v "*" > /tmp/imports.txt; for im in `cat /tmp/imports.txt`; do if [ `grep -v -P "^import" $f | grep -P "[^\w\d$im[^\w\d]" | wc -l` -eq 0 ]; then echo "removing import for $im"; sed -i "/\.$im;$/d" $f; fi; done; done' > $BIN/vuorganizeimports.java
echo 'mvn install dependency:copy-dependencies -DoutputDirectory=lib' > $BIN/vucopyjarstolib.maven
#execute repetitively: watch -n 20 'gradle test 2>&1 | tail -n 40'
#curl get: curl -k "url" -X GET -G -d 'arg1=val1' -d 'arg2=val2'
#curl post: curl -k -v -X POST -d @- <<EOF <data> EOF
#output similar lines in files: comm -12 <(sort file1) <(sort file2)
#split stdin into chunks and pipe into parallel instances of application: seq 100 | parallel --pipe -n 20 cat
#copy stdout into 2 commands - mkfifo or: cat f.txt | tee >(wc -l > /tmp/linecount) | <some other command>
#exit when first command in pipe fails: set -o pipefail
#iterate over pipe status if any part failed: exitarray=("${PIPESTATUS[@]}") && for i in "${!exitarray[@]}" ; do exitCode="${exitarray[$i]}" ... done


##### VIM #####
mkdir -p ~/.vim/colors
cat <<'EOF' > ~/.vim/colors/less.vim
" vim color file
" Maintainer:  Brian Nelson <nelsonbc@gmail.com>
" Last Change: $Revision: 1.1 $ $Date: 2003/12/15 17:25:08 $
"
" Less is More - A minimal color scheme.
" Disigned to work equally well on 8 or 16 colors, terminal or gui.

hi clear
set background=dark
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "less"

hi Normal         term=none ctermfg=7 ctermbg=0 gui=none guifg=LightGray guibg=black
hi Directory      term=bold cterm=bold ctermfg=blue guifg=Blue
hi Search         term=reverse ctermfg=white  ctermbg=blue guifg=white guibg=Blue
hi MoreMsg        term=bold cterm=bold ctermfg=darkgreen gui=bold guifg=DarkGreen
hi ModeMsg        term=bold cterm=bold gui=bold guifg=White guibg=Blue
hi LineNr         term=underline cterm=bold ctermfg=darkcyan guifg=DarkCyan
hi Question       term=standout cterm=bold ctermfg=darkgreen gui=bold guifg=DarkGreen
hi Comment        term=bold cterm=bold ctermfg=0 gui=none guifg=DarkGray
hi Constant       term=bold cterm=none ctermfg=7 gui=none guifg=LightGray
hi Special        term=bold cterm=none ctermfg=3 gui=none guifg=Orange
hi Identifier     term=none cterm=none ctermfg=7 gui=none guifg=LightGray
hi PreProc        term=underline cterm=bold ctermfg=7 gui=bold guifg=White
hi Error          term=reverse cterm=bold ctermfg=7 ctermbg=1 gui=bold guifg=Black guibg=Red
hi Todo           term=standout cterm=none ctermfg=0 ctermbg=7 guifg=Black guibg=White
hi String         term=none cterm=none ctermfg=3 gui=none guifg=LightYellow
hi Function       term=bold cterm=bold ctermfg=3 gui=none guifg=Yellow
hi Statement      term=bold cterm=bold ctermfg=7 gui=bold guifg=White
hi Include        term=bold cterm=bold ctermfg=4 gui=none guifg=LightBlue
hi StorageClass   term=bold cterm=bold ctermfg=5 gui=none guifg=LightMagenta
hi Type           term=none cterm=none ctermfg=7 gui=none guifg=LightGray
hi Defined        term=bold cterm=bold ctermfg=6 gui=none guifg=LightCyan
hi link Character       String
hi link Number          Constant
hi link Boolean         Constant
hi link Float           Number
hi link Conditional     Statement
hi link Repeat          Statement
hi link Label           Statement
hi link Operator        Statement
hi link Keyword         Statement
hi link Exception       Statement
hi link Macro           Include
hi link PreCondit       PreProc
hi link Structure       Type
hi link Typedef         Type
hi link Tag             Special
hi link SpecialChar     Special
hi link Delimiter       Special
hi link SpecialComment  Special
hi link Debug           Special
EOF

cat <<'EOF' > ~/.vimrc
"cd ~/.vim
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
set runtimepath^=~/.vim/bundle/nerdtree
let g:NERDTreeDirArrows=0
let g:NERDTreeWinSize=50

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


##### CREATE NEW ENV #####
#sudo apt-get install vim git unzip
#ssh-keygen -t rsa -C "boiko.roman@gmail.com"
#mkdir ~/ws
#cd ~/ws
#git clone git@github.com:RomanBoiko/dotfiles.git
#rm ~/.bashrc
#ln -s ~/ws/dotfiles/.bashrc ~/.bashrc
#source ~/.bashrc

#sudo apt-get install tree curl wget libxml2-utils make g++
#sudo apt-get install mc eclipse-platform xfonts-terminus chromium-browser lua5.2 ctags
