#!/bin/sh

# We need to use $PWD because symbolic links are glorified strings
ln -sf "$PWD/scripts" ~/.local/bin/
ln -sf "$PWD/bashrc" ~/.bashrc
ln -sf "$PWD/bash_profile" ~/.bash_profile

for f in "$PWD/config/"*
do
    ln -sf "$f" ~/.config/
done

rm -rf ~/.local/service
mkdir -p ~/.local/service
for f in "$PWD/sv/"*
do
    ln -sf "$f" ~/.local/service
done
