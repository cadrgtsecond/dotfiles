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

function ccd () {
	cd "$@"
	changepwd
}
function zz() {
	z "$@"
	changepwd
}

eval "$(zoxide init bash)"
export FZF_DEFAULT_COMMAND='fd -t f'
export FZF_CTRL_T_COMMAND='fd'
eval "$(fzf --bash)"

alias pj="pijul"
. "$HOME/.cargo/env"
