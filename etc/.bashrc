# export PS1='\[\e[32m\]\u@\h \A \[\e[33m\]\w\[\e[0m\]\n\$'
export PS1='\[\e[32m\]\u@\h \A \[\e[33m\]\w\[\e[0m\]\nλ '
#setxkbmap -layout "us,ua" -variant "," -option "grp:alt_shift_toggle"
export HISTCONTROL="ignoredups"
export XMLLINT_INDENT="    "


if [ -d "/cygdrive" ]; then
	export APPS='/cygdrive/c/dev/apps'
	export WORKSPACE='/cygdrive/c/dev/ws'
	export ECLIPSE='/cygdrive/c/dev/apps/eclipse-jee-indigo/eclipse.exe'

	unset TMP
	unset TEMP
	alias ex='explorer .'
	alias path='cygpath -d'
	echo '$APPS/kdiff3/kdiff3.exe  `cygpath -d ${6}` `cygpath -d ${7}` -L1 "${3}" -L2 "${5}"' > ~/bin/kdiff
	echo '$APPS/sublime/sublime_text `cygpath -d ${1}` &' > ~/bin/s
	echo '$ECLIPSE --launcher.openFile `cygpath -d ${1}`' > ~/bin/e
	echo '$APPS/putty/PUTTY.EXE -ssh boikoro@$1 &'                                            > ~/bin/putty
	echo 'java -cp `cygpath -w m2repo/org/codehaus/groovy/groovy-all/1.8.0/groovy-all-1.8.0.jar` groovy.lang.GroovyShell $@' > /usr/local/bin/groovy
else
	export APPS=/home/vu/apps
	export WORKSPACE=/home/vu/ws
	export ECLIPSE=$APPS/eclipse_min/eclipse
	alias pdf=evince
	alias e='$ECLIPSE --launcher.openFile'
	ln -s -f $ECLIPSE /usr/local/bin/eclipse
	echo '$APPS/sublime/sublime_text $1 &' > ~/bin/s
fi

chmod +x ~/bin/*
alias f='find . | grep -v "\.svn" | grep -v "\.git" | grep --color $1'
alias g='find . -type f |  grep -v "\.svn" | grep -v "\.git" | xargs grep -n --color $1'


alias cdw='cd $WORKSPACE'
alias cda='cd $APPS'
alias h='history | grep '
alias ec='s ~/.bashrc'
alias mc='mc -b'
alias http='python -m SimpleHTTPServer'
alias jgit="$APPS/jgit/org.eclipse.jgit.pgm-2.1.0.201209190230-r.sh"
alias soapui="$APPS/soapui/bin/soapui.sh"
alias t="$APPS/textadept/textadept-ncurses"
alias te="$APPS/textadept/textadept"

export EDITOR='$APPS/textadept/textadept-ncurses'
export MAVEN_OPTS=''
export JAVA_HOME=$APPS/jdk
export MAVEN_HOME=$APPS/maven
export GRADLE_HOME=$APPS/gradle
export M2_HOME=$MAVEN_HOME
export ANT_HOME=$APPS/ant

export PATH=~/bin:$APPS/erlang/bin:$GRADLE_HOME/bin:$JAVA_HOME/bin:$ANT_HOME/bin:$MAVEN_HOME/bin:$PATH

alias svnd='svn diff --diff-cmd kdiff'
alias svnl='svn changelist tc'
alias svnci='svn ci --cl tc -m'
alias svnre='svn revert '
alias svnh='history | grep ci'

##### VIM #####
echo 'set number' > ~/.vimrc
echo 'set list listchars=tab:>-,trail:.,extends:>,precedes:<,nbsp:_' >> ~/.vimrc
echo 'set tabstop=4' >> ~/.vimrc
echo 'set shiftwidth=4' >> ~/.vimrc
echo 'set hlsearch' >> ~/.vimrc
#echo 'set cursorline' >> ~/.vimrc
echo 'imap ;; <Esc>' >> ~/.vimrc
echo 'syntax on' >> ~/.vimrc

##### GIT #####
echo '[user]'                           > ~/.gitconfig
echo 'name = boikoro'                  >> ~/.gitconfig
echo 'email = roman.boiko@ubs.com'     >> ~/.gitconfig
echo '[credential]'                    >> ~/.gitconfig
echo 'helper = cache --timeout=3600'   >> ~/.gitconfig
echo '[http]'                          >> ~/.gitconfig
echo 'sslVerify = false'               >> ~/.gitconfig
echo '[diff]'                          >> ~/.gitconfig
echo 'tool = kdiff3'                   >> ~/.gitconfig
echo '[difftool]'                      >> ~/.gitconfig
echo 'prompt = false'                  >> ~/.gitconfig
echo '[difftool "kdiff3"]'             >> ~/.gitconfig
echo 'path = /usr/local/bin/kdiff'     >> ~/.gitconfig
echo 'cmd = "$LOCAL" "$REMOTE"'        >> ~/.gitconfig

echo 'header = Accept-Encoding: none'        > ~/.wgetrc
echo 'user_agent = Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.6) Gecko/20070725 Firefox/2.0.0.6' >> ~/.wgetrc

alias gitd="git difftool"
alias gitco="git checkout"
alias gitm="git checkout master"
alias gitb="git branch"
alias gitst="git status"
alias gitci="git commit"
alias gitup="gitm; jgit fetch origin; git pull origin master"

#updatedb --localpaths='' and locate usage instead of index
#ssh boikoro@web175.webfaction.com

####SUBLIME_KEYBINDINGS#######
# [
# 	{ "keys": ["ctrl+shift+d"], "command": "find_under_expand" },
# 	{ "keys": ["ctrl+d"], "command": "run_macro_file", "args": {"file": "Packages/Default/Delete Line.sublime-macro"} },

# 	{ "keys": ["alt+up"], "command": "swap_line_up" },
# 	{ "keys": ["alt+down"], "command": "swap_line_down" },

# 	{ "keys": ["ctrl+q"], "command": "toggle_side_bar" },
# 	{ "keys": ["ctrl+shift+q"], "command": "focus_side_bar" },

# 	{ "keys": ["ctrl+alt+down"], "command": "duplicate_line" },
# 	{ "keys": ["ctrl+shift+up"], "command": "select_lines", "args": {"forward": false} },
# 	{ "keys": ["ctrl+shift+down"], "command": "select_lines", "args": {"forward": true} }
# ]
