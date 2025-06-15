#!/bin/bash
source /etc/profile

export PATH=$PATH:~/.local/bin:~/.local/bin/scripts
export RUSTFLAGS="-C target-feature=-crt-static"
export EDITOR=kak
