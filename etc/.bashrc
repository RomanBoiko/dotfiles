export PS1='\[\e[32m\]\u@\h \A \[\e[33m\]\w\[\e[0m\]\nλ '
#setxkbmap -layout "us,ua" -variant "," -option "grp:alt_shift_toggle"
export HISTCONTROL="ignoredups"
export XMLLINT_INDENT="    "

export APPS=/home/vu/apps
export WORKSPACE=/home/vu/ws
export ECLIPSE=$APPS/eclipse/eclipse
alias e='$ECLIPSE --launcher.openFile'

alias cdw='cd $WORKSPACE'
alias cda='cd $APPS'
alias h='history | grep '
alias ec='vim ~/.bashrc'
alias mc='mc -b'

export EDITOR='/usr/bin/vim'
export MAVEN_OPTS=''
export JAVA_HOME=$APPS/jdk
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
echo 'email = roman.boiko@ubs.com'     >> ~/.gitconfig
alias gitd="git diff"
alias gitco="git checkout"
alias gitb="git branch"
alias gitst="git status"
alias gitci="git commit"
alias gitup="git checkout master; git fetch origin; git pull origin master"

