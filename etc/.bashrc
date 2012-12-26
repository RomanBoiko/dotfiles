export PS1='\[\e[32m\]\u@\h \A \[\e[33m\]\w\[\e[0m\]\n\$'
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
	echo '$APPS/kdiff3/kdiff3.exe  `cygpath -d ${6}` `cygpath -d ${7}` -L1 "${3}" -L2 "${5}"' > /usr/local/bin/kdiff.sh
	echo '$APPS/sublime/sublime_text `cygpath -d ${1}` &' > /usr/local/bin/s
	echo '$ECLIPSE --launcher.openFile `cygpath -d ${1}`' > /usr/local/bin/e
else
	export APPS=/home/vu/apps
	export WORKSPACE=/home/vu/ws
	export ECLIPSE=eclipse
	alias pdf=evince
	alias e='$ECLIPSE --launcher.openFile'
fi

echo 'find . | grep -v "\.svn" | grep -v "\.git" | grep --color $1' > /usr/local/bin/f
echo 'find . -type f |  grep -v "\.svn" | grep -v "\.git" | xargs grep -n --color $1' > /usr/local/bin/g
chmod +x /usr/local/bin/*

alias cdw='cd $WORKSPACE'
alias cda='cd $APPS'
alias h='history | grep '
alias ec='s ~/.bashrc'
alias mc='mc -b'

export EDITOR='vim'
export MAVEN_OPTS=''
export JAVA_HOME=$APPS/jdk
export MAVEN_HOME=$APPS/maven
export GRADLE_HOME=$APPS/gradle
export M2_HOME=$MAVEN_HOME
export ANT_HOME=$APPS/ant

export PATH=$APPS/erlang/bin:$GRADLE_HOME/bin:$JAVA_HOME/bin:$ANT_HOME/bin:$MAVEN_HOME/bin:$PATH

alias svnd='svn diff --diff-cmd kdiff.sh'
alias svnl='svn changelist tc'
alias svnci='svn ci --cl tc -m'

#####VIM#####
echo 'set number' > ~/.vimrc
echo 'set list listchars=eol:$,tab:>-,trail:.,extends:>,precedes:<,nbsp:_' >> ~/.vimrc
echo 'set tabstop=4' >> ~/.vimrc
echo 'set shiftwidth=4' >> ~/.vimrc
echo 'set hlsearch' >> ~/.vimrc
#echo 'set cursorline' >> ~/.vimrc
echo 'imap ;; <Esc>' >> ~/.vimrc
echo 'syntax on' >> ~/.vimrc

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
