#!/bin/bash
source /etc/profile

HISTFILE=""
export PATH=$PATH:~/.local/bin:~/.local/bin/scripts
export RUSTFLAGS="-C target-feature=-crt-static"
export EDITOR=kak
export BEMENU_OPTS="-W 0.8 --fn Iosevka"
export SPAWND_FIFO="$XDG_RUNTIME_DIR/spawn"
. "$HOME/.cargo/env"
