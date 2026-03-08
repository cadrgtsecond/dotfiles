#!/bin/bash
source /etc/profile

HISTFILE=''
export PATH=$PATH:~/.local/bin:~/.local/bin/scripts
export RUSTFLAGS="-C target-feature=-crt-static"
export EDITOR=kak
export BROWSER=brw
export BEMENU_OPTS="-W 0.8 --fn /usr/share/fonts/iosevka/Iosevka-Regular.ttc"
export FZF_DEFAULT_COMMAND='fd -t f'
export FZF_DEFAULT_OPTS='--layout=reverse -m'
export EXECD_FIFO="$XDG_RUNTIME_DIR/exec"
export LESSHISTFILE=~/.cache/less_history
export RLWRAP_HOME=~/.cache
export GIT_CONFIG_GLOBAL=~/.config/git/config

. "$HOME/.cargo/env"
