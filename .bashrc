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
cat <<'EOF' > ~/.vimrc
set t_Co=256
set term=xterm
set encoding=utf8
set ffs=unix,dos
set noswapfile
set nobackup

set number
set nospell
set nowrap

set nowildmenu
set wildignore+=*/target/*,*/classes/*,*/.class,*/.svn/*,*/.git/*
set wildmode=list:longest,full
set wildignorecase

set incsearch
set hlsearch

syntax off
set nopaste
set list listchars=tab:>-,trail:.,extends:>,precedes:<,nbsp:_
set noexpandtab
set tabstop=4
set shiftwidth=4
set autoindent
set cindent
"don't stop word on underscore
set iskeyword+=_

"move in wrapped lines
map j gj
map k gk

"moving selected block in visual mode
vnoremap K xkP\`[V\`]
vnoremap J xp\`[V\`]
vnoremap L >gv
vnoremap H <gv

"quickly insert an empty new line without entering insert mode
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>

nnoremap <C-h> <Esc>:vimgrep  **/*<Left><Left><Left><Left><Left>
nnoremap <C-p> <Esc>:e **/
"replay macro, recorded with qq
nnoremap <Space> @q

set makeprg=vucompiler.java
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
map <F2> :make<cr>:copen<cr>
"quickfix window :copen, :cnext or :cn, :cprevious, :cclose :cw (search results?)

"colorscheme
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

"quick template examples
iabbrev syso System.out.println("");<LEFT><LEFT><LEFT>
iabbrev pub public void () {<CR><CR>}<UP>
EOF

###VIM Tags format. i.e. save that lines to ~/erlang_tags
##  Load tags => :set tags+=~/erlang_tags
##  Search tags => :tag /<search pattern or ...>
#facade:start	/mnt/c/dev/ws/try/facade.erl	/start() -> /
#helloc:Veh	/mnt/c/dev/ws/try/helloc.c	/typedef struct Veh/


### UTILITY COMMANDS/SCRIPTS ###
function java_organize_imports() {
  for f in `find . -name "*.java"`; do echo "==> $f";grep -P "^import" $f | grep -o -P "[^.]+(?=;)" | grep -v "*" > /tmp/imports.txt; for im in `cat /tmp/imports.txt`; do if [ `grep -v -P "^import" $f | grep -P "[^\w\d$im[^\w\d]" | wc -l` -eq 0 ]; then echo "removing import for $im"; sed -i "/\.$im;$/d" $f; fi; done; done
}

function java_compile() {
  RESULTS=/tmp
  find src/ -name *.java | xargs javac -d $RESULTS -cp `find lib -name *.jar | tr "\n" ":"`
}

function mvncopyjars() {
  mvn dependency:copy-dependencies -DoutputDirectory=lib
}

function eclipsefiles() {
  cat > .project << EOF
<?xml version="1.0" encoding="UTF-8"?>
<projectDescription>
  <name>$(basename $(pwd))</name>
  <projects/>
  <buildSpec>
    <buildCommand>
      <name>org.eclipse.jdt.core.javabuilder</name>
    </buildCommand>
  </buildSpec>
  <natures>
    <nature>org.eclipse.jdt.core.javanature</nature>
  </natures>
</projectDescription>
EOF

  cat > .classpath << EOF
<?xml version="1.0" encoding="UTF-8"?>
<classpath>
    <classpathentry including="**/*.java" kind="src" path="src/main/java"/>
    <classpathentry including="**/*.java" kind="src" output="target/test-classes" path="src/test/java"/>
    <classpathentry excluding="**/*.java" kind="src" path="src/main/resources"/>
    <classpathentry excluding="**/*.java" kind="src" output="target/test-classes" path="src/test/resources"/>
    <classpathentry kind="con" path="org.eclipse.jdt.launching.JRE_CONTAINER/org.eclipse.jdt.internal.debug.ui.launcher.StandardVMType/JavaSE-1.8">
        <attributes>
            <attribute name="module" value="true"/>
        </attributes>
    </classpathentry>
$(for f in `find lib -type f -name *.jar`; do echo "    <classpathentry kind=\"lib\" path=\"${f}\"/>"; done)
    <classpathentry kind="output" path="target/classes"/>
</classpath>
EOF
}

function eclipseproject() {
  rm -Rf lib && mvncopyjars && eclipsefiles
}
