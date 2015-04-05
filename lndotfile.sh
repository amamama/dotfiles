#!/bin/sh
#dotfiles/lndotfiles.sh

ln -s -i $(pwd)"/".bashrc ~/.bashrc
ln -s -i $(pwd)"/".bash_aliases ~/.bash_aliases
ln -s -i $(pwd)"/".bash_funcs ~/.bash_funcs
ln -s -i $(pwd)"/".vimrc ~/.vimrc
ln -s -i $(pwd)"/".Xresources ~/.Xresources

ln -s -i $(pwd)"/".w3m/config ~/.w3m/config
ln -s -i $(pwd)"/".w3m/keymap ~/.w3m/keymap
