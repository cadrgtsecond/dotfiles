#!/bin/bash

PS1="\e[34m\w\e[0m>\n \e[32mλ\e[0m "

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
export FZF_CTRL_T_COMMAND='fd'
eval "$(fzf --bash)"

alias pj="pijul"
. "$HOME/.cargo/env"
