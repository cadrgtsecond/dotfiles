#!/bin/bash

export PATH=$PATH:~/.local/bin

HISTFILE="~/.cache/bash/history"
export PS1=" \e[36m\w\e[37;2m>\e[0m\n \e[32mλ \e[0m"
export RUSTFLAGS="-C target-feature=-crt-static"

# Quick cd hack
touch /dev/shm/pwd
function cd () {
	builtin cd $@
	pwd > /dev/shm/pwd
}
function lcd() {
	builtin cd $@
}
cd $(cat /dev/shm/pwd)

source /home/god/.config/broot/launcher/bash/br
