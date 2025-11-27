#!/bin/bash

# History
HISTFILE=~/.cache/bash_history
export LESSHISTFILE=~/.cache/less_history
export PYTHON_HISTORY=~/.cache/python_history
export PROMPT_COMMAND='history -a'
export RLWRAP_HOME=~/.cache

printf '\n'
PS1="\e[s\e[H\e[K\e[34m\w\e[0m>\n\e[u \e[32mλ\e[0m "

set_theme &

# Quick cd hack
[ -f /tmp/pwd ] || echo "$HOME" > /tmp/pwd
function ccd () {
	cd "$@"
	pwd > /tmp/pwd
}
cd "$(cat /tmp/pwd)"
function zz() {
    z "$@"
    ccd .
}

if [ -n "$START_COMMAND" ]
then
    start_command=$START_COMMAND
    unset START_COMMAND
    eval "$start_command"
fi

eval "$(zoxide init bash)"
export FZF_DEFAULT_COMMAND='fd -t f'
export FZF_CTRL_T_COMMAND='fd'
eval "$(fzf --bash)"
. "$HOME/.cargo/env"

alias pj="pijul"
