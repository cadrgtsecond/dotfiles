#!/bin/bash
HISTFILE="~/.cache/bash/history"
export PS1=" \e[36m\w\e[37;2m>\e[0m\n \e[32mλ \e[0m"

set_theme &

# Quick cd hack
touch /dev/shm/pwd
function ccd () {
	cd "$@"
	pwd > /dev/shm/pwd
}
cd "$(cat /dev/shm/pwd)"

if [ -n "$START_COMMAND" ]
then
    start_command=$START_COMMAND
    unset START_COMMAND
    eval "$start_command"
fi

eval "$(zoxide init bash)"
eval "$(fzf --bash)"
. "$HOME/.cargo/env"

