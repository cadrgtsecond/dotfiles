#!/bin/bash


# We need to use $PWD because symbolic links are glorified strungs
ln -sf "$PWD/bashrc" ~/.bashrc

ln -sf "$PWD/config/river" ~/.config/
ln -sf "$PWD/config/foot" ~/.config/
ln -sf "$PWD/config/yambar" ~/.config/
ln -sf "$PWD/config/kak" ~/.config/
ln -sf "$PWD/config/flavours" ~/.config/
ln -sf "$PWD/config/lem" ~/.config/
