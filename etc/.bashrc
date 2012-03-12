export PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \A \[\e[33m\]\w\[\e[0m\]\n\$'
#setxkbmap -layout "us,ua" -variant "," -option "grp:alt_shift_toggle"


export APPS_HOME=/home/vu/apps
export JAVA_HOME=$APPS_HOME/jdk
export MAVEN_HOME=$APPS_HOME/maven
export M2_HOME=$MAVEN_HOME
export ANT_HOME=$APPS_HOME/ant

export PATH=$PATH:$JAVA_HOME/bin:$ANT_HOME/bin:$MAVEN_HOME/bin

alias cdw='cd /home/vu/ws'
alias cda='cd $APPS_HOME'
alias cds='cd /home/vu/ws/master'
alias cdf='cd /media/disk'

alias ll='ls -l'
alias la='ls -la'

#alias sq='sqlplus orcl/orcl@XE'
alias e='eclipse --launcher.openFile'
alias ge=gedit
alias pdf=evince
alias mc='mc -b'

alias nw='sudo /etc/init.d/network-manager restart'
alias or='sudo /etc/init.d/oracle-xe restart'

#alias xt='xterm  -fa -*-dejavu -fs 9 -geometry 211x57+0+05'

export XMLLINT_INDENT="    "


#--------------
#ORACLE_HOME=/usr/lib/oracle/xe/app/oracle/product/10.2.0/server
#export ORACLE_HOME
#ORACLE_SID=XE
#export ORACLE_SID
#PATH=$PATH:$ORACLE_HOME/bin
#export PATH


#####VIM#####
echo 'set number' > ~/.vimrc
echo 'set list listchars=eol:$,tab:>-,trail:.,extends:>,precedes:<,nbsp:_' >> ~/.vimrc
echo 'set tabstop=4' >> ~/.vimrc
echo 'set shiftwidth=4' >> ~/.vimrc
echo 'set hlsearch' >> ~/.vimrc
echo 'set cursorline' >> ~/.vimrc
echo 'imap ;; <Esc>' >> ~/.vimrc
echo 'syntax on' >> ~/.vimrc


