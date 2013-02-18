# path
# use homebrew git instead of system git
export PATH=/usr/local/Cellar/git/1.8.1.3/bin:$PATH:$HOME/.rvm/bin

# environment
# export JAVA_HOME=/Library/Java/Home
# export JRE_HOME=$JAVA_HOME

# aliases
alias ..='cd ..'
alias ...='cd .. ; cd ..'
alias ll='ls -lh'
alias lll='CLICOLOR_FORCE=true ll | less -R'
alias lal='ls -alh'
alias lall='CLICOLOR_FORCE=true lal | less -R'
alias hs='history | grep'
alias pg='ps aux | grep'
alias g='git'
alias pg_start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pg_stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
alias mysql_start='mysql.server start'
alias mysql_stop='mysql.server stop'
alias ystart='hybris/bin/platform/hybrisserver.sh debug'
alias yant='cd hybris/bin/platform && . ./setantenv.sh && cd -'
alias ysolr='java -Dsolr.solr.home=multicore -jar start.jar'
# shows most used commands
alias profileme="history | awk '{print \$5}' | awk 'BEGIN{FS=\"|\"}{print \$1}' | sort | uniq -c | sort -n | tail -n 20 | sort -nr"

# bash completions
[[ -s "/usr/local/Library/Contributions/brew_bash_completion.sh" ]] && source "/usr/local/Library/Contributions/brew_bash_completion.sh"
[[ -s "~/.lein/bash-completion.bash" ]] && source "~/.lein/bash-completion.bash"
[[ -s "/usr/local/etc/bash_completion.d/git-completion.bash" ]] && source "/usr/local/etc/bash_completion.d/git-completion.bash"
[[ -s "/usr/local/etc/bash_completion.d/git-prompt.sh" ]] && source "/usr/local/etc/bash_completion.d/git-prompt.sh"
[[ -s "/usr/local/etc/bash_completion.d/tmux" ]] && source "/usr/local/etc/bash_completion.d/tmux"
[[ -s "/usr/local/etc/bash_completion.d/scala" ]] && source "/usr/local/etc/bash_completion.d/scala"

# emacs
alias emacs='open -a /usr/local/Cellar/emacs/24.2/Emacs.app "$@"'
# emacs in the terminal
ec () {
    if ps x | grep -v 'grep' | grep 'Emacs' > /dev/null
    then
        /usr/local/Cellar/emacs/24.2/bin/emacsclient -nw "$@"
    else
        /usr/local/Cellar/emacs/24.2/bin/emacs -nw "$@"
    fi
}
export -f ec
export EDITOR='ec'

# custom bash completions
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

# history 
export HISTTIMEFORMAT='%Y-%m-%d %H:%M:%S - '
export HISTSIZE=100000
export HISTFILESIZE=100000
# ignore commands starting with space and dupes
export HISTCONTROL=ignoreboth
# append history from current session rather than overwrite
shopt -s histappend
# write multiline commands as a single line in history
shopt -s cmdhist
# enable ** glob directory style matching
# shopt -s globstar - performance seems really bad!
# enable automatic cd
shopt -s autocd

# color options for misc commands
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;35'

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

# prompt
GIT_BRANCH='$(__git_ps1 " (%s)")'
if [[ $EMACS = 't' ]]; then
  export PS1="\u@\h:\w$GIT_BRANCH $ "
else
  export PS1="${txtgrn}[${txtrst}\t${txtgrn}] ${txtblu}\u${txtwht}@${txtblu}\h:${txtylw}\w$GIT_BRANCH ${txtrst}$ "
fi

# mysql prompt
export MYSQL_PS1="[\\r:\\m:\\s] \\u@\\h (\\d) > "

# oracle instant client
#export ORACLE_IC_HOME="/Users/lane/oracle/instantclient_10_2"
#export ORACLE_HOME="$ORACLE_IC_HOME"
#export TNS_ADMIN="$ORACLE_IC_HOME"
#export PATH="$PATH:$ORACLE_IC_HOME"
#export LD_LIBRARY_PATH="$ORACLE_IC_HOME"
#export DYLD_LIBRARY_PATH="$ORACLE_IC_HOME"
#export CLASSPATH="$ORACLE_IC_HOME/ojdbc14.jar:./"

# rvm
#export CC=gcc-4.2
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
