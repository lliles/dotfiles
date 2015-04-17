# path
# put homebrew ahead of everything
export PATH=/usr/local/bin:$PATH

# secrets
[[ -f "$HOME/.secrets" ]] && source "$HOME/.secrets"

# java environment
export JAVA_HOME=$(/usr/libexec/java_home)
# export JRE_HOME=$JAVA_HOME
export MAVEN_OPTS='-Xmx1024m -XX:MaxPermSize=256m'
# java 6 home helper
alias set-java-home-6='export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Versions/1.6.0/Home"'

# aliases
alias ..='cd ..'
alias ...='cd .. ; cd ..'
alias ll='ls -lh'
alias lll='CLICOLOR_FORCE=true ll | less -R'
alias lal='ls -alh'
alias lall='CLICOLOR_FORCE=true lal | less -R'
alias hs='history | grep'
alias pg='ps aux | grep'
alias pg_start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pg_stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
alias mysql_start='mysql.server start'
alias mysql_stop='mysql.server stop'
alias ystart='hybris/bin/platform/hybrisserver.sh debug'
alias yant='cd hybris/bin/platform && . ./setantenv.sh && cd -'
alias ysolr='java -Dsolr.solr.home=multicore -jar start.jar'
alias redis_start='redis-server /usr/local/etc/redis.conf'
alias es_start='elasticsearch --config=/usr/local/opt/elasticsearch/config/elasticsearch.yml'

# show most used commands
alias profileme="history | awk '{print \$5}' | awk 'BEGIN{FS=\"|\"}{print \$1}' | sort | uniq -c | sort -n | tail -n 20 | sort -nr"

# bash completions
[[ -f "$HOME/.lein/bash-completion.bash" ]] && source "$HOME/.lein/bash-completion.bash"
[[ -f $(brew --prefix)/etc/bash_completion ]] && source $(brew --prefix)/etc/bash_completion

# editors (for git, emacs, & others)
export EDITOR='/usr/local/bin/emacsclient -nw'
export ALTERNATE_EDITOR='/usr/local/bin/emacs -nw'
# emacs in the app
alias emacs='open -a /Applications/Emacs.app "$@"'
# emacs in the terminal
alias e='/usr/local/bin/emacsclient -nw -a=/usr/local/bin/emacs "$@"'

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

# cd options
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
  export PS1="${txtgrn}[${txtrst}\t${txtgrn}] ${txtblu}\u${txtwht}@${txtblu}\h:${txtylw}\w$GIT_BRANCH ${txtrst}\n$ "
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

### Added by the Heroku Toolbelt
#export PATH="/usr/local/heroku/bin:$PATH"

# rvm
export PATH="$PATH:$HOME/.rvm/bin"
# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

