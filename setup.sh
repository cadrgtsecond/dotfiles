#!/bin/sh

# We need to use $PWD because symbolic links are glorified strings
ln -sf "$PWD/scripts" ~/.local/bin/scripts
ln -sf "$PWD/bashrc" ~/.bashrc
ln -sf "$PWD/bash_profile" ~/.bash_profile

for f in "$PWD/config/"*; do
    ln -sf "$f" ~/.config/
done

# Don't change preexisting services
[ -d ~/.local/share ] && exit
mkdir -p ~/.local/service
for f in "$PWD/sv/"*; do
    ln -sf "$f" ~/.local/service
done
