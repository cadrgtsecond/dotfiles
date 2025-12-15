#!/bin/bash
source /etc/profile

HISTFILE=""
export PATH=$PATH:~/.local/bin:~/.local/bin/scripts
export RUSTFLAGS="-C target-feature=-crt-static"
export EDITOR=kak
export BRAIN_DIR=~/Documents/notes
export BEMENU_OPTS="-W 0.8"
export SPAWND_FIFO="$XDG_RUNTIME_DIR/spawn"
mkfifo "$SPAWND_FIFO"
. "$HOME/.cargo/env"
