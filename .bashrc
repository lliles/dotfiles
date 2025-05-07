# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# secrets
[[ -f "$HOME/.secrets" ]] && source "$HOME/.secrets"

# aliases
alias g='git'
alias ll='ls -lh'
alias lal='ls -alh'

# tmux aliases
alias tl='tmux ls'
function ta { tmux attach -t "$1" || tmux new -s "$1"; }

# show most used commands
alias profileme="history | awk '{print \$5}' | awk 'BEGIN{FS=\"|\"}{print \$1}' | sort | uniq -c | sort -n | tail -n 20 | sort -nr"

# bash completions
[[ -r "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh" ]] && . "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh"
complete -C aws_completer aws
# completion for aliased g = git
__git_complete g __git_main

# editors (for git, emacs, & others)
# export EDITOR='/usr/local/bin/emacsclient -nw'
# export ALTERNATE_EDITOR='/usr/local/bin/emacs -nw'
# emacs in the app
# alias emacs='open -a /Applications/Emacs.app "$@"'
# emacs in the terminal
# alias e='/usr/local/bin/emacsclient -nw -a=/usr/local/bin/emacs "$@"'

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
# append each command to history as it happens, instead of at end of session
PROMPT_COMMAND='history -a'

# cd options
# enable automatic cd
shopt -s autocd

# color options for misc commands
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;33'

# load base16 colors
[[ -f "$HOME/dev/dotfiles/base16-tomorrow.dark.sh" ]] && source "$HOME/dev/dotfiles/base16-tomorrow.dark.sh"

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
GIT_BRANCH='$(__git_ps1 "(%s)")'
if [[ $EMACS = 't' ]]; then
  export PS1="\u@\h:\w $GIT_BRANCH $ "
else
  export PS1="${txtgrn}[${txtrst}\t${txtgrn}] ${txtblu}\u${txtwht}@${txtblu}\h:${txtylw}\w $GIT_BRANCH ${txtrst}\n$ "
fi

# mysql prompt
export MYSQL_PS1="[\\r:\\m:\\s] \\u@\\h (\\d) > "

# For getting python installed with tcl-tk (for Matplotlib), requires having tcl-tk and zlib installed
# For compilers to find zlib you may need to set:
# export LDFLAGS="${LDFLAGS} -L/usr/local/opt/zlib/lib"
# export CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/zlib/include"
# For pkg-config to find zlib you may need to set:
# export PKG_CONFIG_PATH="${PKG_CONFIG_PATH} /usr/local/opt/zlib/lib/pkgconfig"
# export LDFLAGS="${LDFLAGS} -L/usr/local/opt/tcl-tk/lib"
# export CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/tcl-tk/include"
# export PATH=$PATH:/usr/local/opt/tcl-tk/bin

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# pyenv virtualenv plugin to automatically activate envs
eval "$(pyenv virtualenv-init -)"

# VSCode 'code' CLI
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# java 11 for tinkerpop
export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/lane/.cache/lm-studio/bin"

# Added by uv install script
. "$HOME/.local/bin/env"
