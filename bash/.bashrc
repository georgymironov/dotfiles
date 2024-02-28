shopt -s histappend
shopt -s cdspell dirspell autocd
shopt -s no_empty_cmd_completion

set -o ignoreeof

export HISTCONTROL=ignoreboth:erasedups
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

export EDITOR=vim

export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude ".git"'

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

HISTSIZE=10000000
HISTFILESIZE=20000000

if [[ $- == *i* ]]; then
    BOLD="\[$(tput bold)\]"
    RED="\[$(tput setaf 1)\]"
    GREEN="\[$(tput setaf 2)\]"
    MAGENTA="\[$(tput setaf 5)\]"
    GREY="\[$(tput setaf 7)\]"
    LIGHT_BLUE="\[$(tput setaf 14)\]"
    RESET="\[$(tput sgr0)\]"
fi

if [[ -n $SSH_CLIENT ]]; then
    HOST_COLOR=$MAGENTA
else
    HOST_COLOR=$GREEN
fi

_hostname=$(hostname | awk -F '' '{if (NF > 20) {print substr($0, 0, 21)"..."} else print $0}')
PS1="${BOLD}${HOST_COLOR}\u@$_hostname ${GREY}\D{%T} ${RESET}${BOLD}[\w]${GREY}\$(__git_ps1)${LIGHT_BLUE}\n#${RESET} "

type fdfind &>/dev/null && alias fd='fdfind --hidden --no-ignore --follow' || alias fd='find . -name'
type rg &>/dev/null && alias rg='rg --hidden --no-ignore --follow --smart-case'

alias ls='ls --color=auto -hAF'
alias ll='ls -l'
alias grep='grep --color=auto'
alias df='df -h'
alias du='du -sh'
alias vi='vim'
alias sudo='sudo '
alias py='python3'
alias ipy='ipython3'
alias mkdir='mkdir -p'
alias cp='cp -r'
alias scp='scp -r'
alias cl='clear'
alias rsync='rsync -a -v -h'
alias k='kubectl'

type bazelisk &>/dev/bull && alias bazel='bazelisk'
alias b='bazel'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

BR=$HOME/.config/broot/launcher/bash/br
[ -f $BR ] && source $BR

