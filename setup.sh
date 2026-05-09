#!/bin/sh

# We need to use $PWD because symbolic links are glorified strings
ln -sfT "$PWD/scripts" ~/.local/bin/scripts
ln -sfT "$PWD/bashrc" ~/.bashrc
ln -sfT "$PWD/bash_profile" ~/.bash_profile

for f in "$PWD/config/"*; do
    ln -sf "$f" ~/.config/
done
ln -sfT "$PWD/themes" ~/.config/themes

# Don't change preexisting services
[ -d ~/.local/share ] && exit
mkdir -p ~/.local/service
for f in "$PWD/sv/"*; do
    ln -sf "$f" ~/.local/service
done
