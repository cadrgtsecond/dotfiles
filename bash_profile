#!/bin/bash
source /etc/profile

export PATH=$PATH:~/.local/bin:~/.local/bin/scripts
export RUSTFLAGS="-C target-feature=-crt-static"
export EDITOR=kak
export BEMENU_OPTS="-W 0.8 --fn Iosevka"
export FZF_DEFAULT_COMMAND='fd -t f'
export FZF_DEFAULT_OPTS='--layout=reverse -m'
export EXECD_FIFO="$XDG_RUNTIME_DIR/exec"
. "$HOME/.cargo/env"
