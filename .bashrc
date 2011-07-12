# sourced files
# mac
if [ -f /Users/lane/dev/leiningen/bash_completion.bash ]; then
    . /Users/lane/dev/leiningen/bash_completion.bash
fi
if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
    . /usr/local/etc/bash_completion.d/git-completion.bash
fi
#ubuntu
if [ -f /home/lane/apps/leiningen/bash_completion.bash ]; then
    . /home/lane/apps/leiningen/bash_completion.bash
fi
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# java 
#export JAVA_HOME=/Library/Java/Home
#export JRE_HOME=$JAVA_HOME
#export CATALINA_HOME=/Applications/Tomcat

# terminal colors
export TERM=xterm-256color

# custom functions
ystart () {
    hybris/bin/platform/hybrisserver.sh debug
}
export -f ystart
yant () {
    cd hybris/bin/platform && . ./setantenv.sh && cd -
}
export -f yant

# bash completions
_complete_ssh_hosts ()
{
        COMPREPLY=()
        cur="${COMP_WORDS[COMP_CWORD]}"
        comp_ssh_hosts=`cat ~/.ssh/known_hosts | \
                        cut -f 1 -d ' ' | \
                        sed -e s/,.*//g | \
                        grep -v ^# | \
                        uniq | \
                        grep -v "\[" ;
                if [ -f ~/.ssh/config ]; then
                        cat ~/.ssh/config | \
                                grep "^Host " | \
                                awk '{print $2}'
                fi
                `
        COMPREPLY=( $(compgen -W "${comp_ssh_hosts}" -- $cur))
        return 0
}
complete -F _complete_ssh_hosts ssh scp sftp

_complete_mvn_goals ()
{
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  goals="clean compile install test tomcat:redeploy war:war"
  COMPREPLY=( $(compgen -W "${goals}" -- ${cur}))
  return 0
}
complete -F _complete_mvn_goals mvn

# friendly ansi color names
txtblk='\[\e[0;30m\]' # Black - Regular
txtred='\[\e[0;31m\]' # Red
txtgrn='\[\e[0;32m\]' # Green
txtylw='\[\e[0;33m\]' # Yellow
txtblu='\[\e[0;34m\]' # Blue
txtpur='\[\e[0;35m\]' # Purple
txtcyn='\[\e[0;36m\]' # Cyan
txtwht='\[\e[0;37m\]' # White
bldblk='\[\e[1;30m\]' # Black - Bold
bldred='\[\e[1;31m\]' # Red
bldgrn='\[\e[1;32m\]' # Green
bldylw='\[\e[1;33m\]' # Yellow
bldblu='\[\e[1;34m\]' # Blue
bldpur='\[\e[1;35m\]' # Purple
bldcyn='\[\e[1;36m\]' # Cyan
bldwht='\[\e[1;37m\]' # White
unkblk='\[\e[4;30m\]' # Black - Underline
undred='\[\e[4;31m\]' # Red
undgrn='\[\e[4;32m\]' # Green
undylw='\[\e[4;33m\]' # Yellow
undblu='\[\e[4;34m\]' # Blue
undpur='\[\e[4;35m\]' # Purple
undcyn='\[\e[4;36m\]' # Cyan
undwht='\[\e[4;37m\]' # White
bakblk='\[\e[40m\]'   # Black - Background
bakred='\[\e[41m\]'   # Red
badgrn='\[\e[42m\]'   # Green
bakylw='\[\e[43m\]'   # Yellow
bakblu='\[\e[44m\]'   # Blue
bakpur='\[\e[45m\]'   # Purple
bakcyn='\[\e[46m\]'   # Cyan
bakwht='\[\e[47m\]'   # White
txtrst='\[\e[0m\]'    # Text Reset

# more colors
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
# turn on grep coloring
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;36'


# history 
export HISTTIMEFORMAT='%Y-%m-%d %H:%M:%S - '
# append history from session to file rather than overwrite
shopt -s histappend
# write multiline commands as a single line in history
shopt -s cmdhist
# session history size
export HISTSIZE=10000
# file history size
export HISTFILESIZE=10000
# ignore commands starting with space and dupes
export HISTCONTROL=ignoreboth
# read history file
# PROMPT_COMMAND='$PROMPT_COMMAND;history -n'
# append to history file
PROMPT_COMMAND='history -a'


# fixing reverse search in Terminal.app
# added \[ & \] to all escape sequences above
# set TERM="xterm" instead of "xterm-color"
#export TERM="xterm"
# set 'shopt -s checkwinsize' to check window size before each prompt
#shopt -s checkwinsize 

# aliases
alias ls='ls --color=auto'
alias ll='ls -lh --color=auto'
alias lll='ls -lh --color=always | less -R'
alias lal='ls -alh --color=auto'
alias hg='history | grep'
alias psg='ps aux|grep'
alias pg_start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pg_stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
alias mysql_start='mysql.server start'
alias mysql_stop='mysql.server stop'

# PATH
export PATH=$PATH:~/apps/leiningen

# prompt
GIT_BRANCH='$(__git_ps1 " (%s)")'
export PS1="${txtred}[${txtrst}\!${txtred}] ${txtgrn}\t ${txtblu}\u${txtwht}@${txtblu}\h:${txtylw}\w$GIT_BRANCH ${txtrst}$ "
if [[ $EMACS = 't' ]]; then
  export PS1="[\!] \t \u@\h:\w$GIT_BRANCH $ "
else
  export PS1="${txtred}[${txtrst}\!${txtred}] ${txtgrn}\t ${txtblu}\u${txtwht}@${txtblu}\h:${txtylw}\w$GIT_BRANCH ${txtrst}$ "
fi


# mysql prompt
export MYSQL_PS1="[\\r:\\m:\\s] \\u@\\h (\\d) > "

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

