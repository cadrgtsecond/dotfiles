#!/bin/bash
source /etc/profile

export PATH=$PATH:~/.local/bin:~/.local/bin/scripts
export RUSTFLAGS="-C target-feature=-crt-static"
export EDITOR=kak
export BRAIN_DIR=~/Documents/notes
export BEMENU_OPTS="-W 0.8"
. "$HOME/.cargo/env"
