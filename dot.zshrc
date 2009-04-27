export PATH=/usr/local/bin:/opt/local/bin:/opt/local/sbin:$PATH

# number of lines kept in history
export HISTSIZE=10000
# number of lines saved in the history after logout
export SAVEHIST=10000
# location of history
export HISTFILE=~/.zshhistory
# append command to history file once executed
setopt INC_APPEND_HISTORY

# Disable core dumps
limit coredumpsize 0

# Emacs key bind
bindkey -e

# set the del key to back delete
bindkey "\e[3~" delete-char

WORDCHARS='*?_-[]~=&;!#$%^(){}<>'

# set the auto complete {{{
setopt AUTO_LIST
setopt AUTO_MENU
# setopt MENU_COMPLETE

autoload -U compinit
compinit

# Completion caching
# zstyle ':completion::complete:*' use-cache on
# zstyle ':completion::complete:*' cache-path .zcache
# zstyle ':completion:*:cd:*' ignore-parents parent pwd

# Completion Options
zstyle ':completion:*:match:*' original only
zstyle ':completion::prefix-1:*' completer _complete
zstyle ':completion:predict:*' completer _complete
zstyle ':completion:incremental:*' completer _complete _correct
zstyle ':completion:*' completer _complete _prefix _correct _prefix _match _approximate

# Path Expansion
zstyle ':completion:*' expand 'yes'
zstyle ':completion:*' squeeze-shlashes 'yes'
zstyle ':completion::complete:*' '\\'

zstyle ':completion:*:*:*:default' menu select
zstyle ':completion:*:*:default' force-list always

# GNU Colors you must have /etc/DIR_COLORS file 
# [ -f /etc/DIR_COLORS ] && eval $(dircolors -b /etc/DIR_COLORS)
if (which dircolors >& /dev/null) && [ -e $HOME/.dircolors ]; then
	eval `dircolors $HOME/.dircolors` # 色の設定
fi
export ZLSCOLORS="${LS_COLORS}"
zmodload zsh/complist
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# Complete the kill command
compdef pkill=kill
compdef pkill=killall
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:*:*:*:processes' force-list always
zstyle ':completion:*:processes' command 'ps -au$USER'

# Group matches and Describe
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:descriptions' format $'\e[01;33m -- %d --\e[0m'
zstyle ':completion:*:messages' format $'\e[01;35m -- %d --\e[0m'
zstyle ':completion:*:warnings' format $'\e[01;31m -- No Matches Found --\e[0m'
# }}}

# alias
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
# alias ls='ls -F --color=auto'
# alias ll='ls -l'
alias grep='grep --color=auto'
alias ee='emacsclient -t'
alias gls='gls -F --color=auto'
#### man
if which jman >& /dev/null; then
	alias man="LC_ALL=ja_JP.eucJP jman"
fi

# export PROMPT="[%n@%m %1/]
# %# "
# Prompt setting {{{
# RPROMPT=$(echo '%{\033[31m%}%D %T%{\033[m%}')
# PROMPT=$(echo '%{\033[35m%}%M%{\033[32m%}%/
#%{\033[36m%}%n %{\033[01;31m%}>%{\033[33m%}>%{\033[35m%}>%{\033[m%} ')
[ "$TERM" = "dumb" ] || . ~/.zshprompt
# }}}

