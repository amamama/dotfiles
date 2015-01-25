#!/bin/sh
#dotfiles/lndotfiles.sh

ln -s $(pwd)"/".bashrc ~/.bashrc
ln -s $(pwd)"/".bash_aliases ~/.bash_aliases
ln -s $(pwd)"/".bash_funcs ~/.bash_funcs
ln -s $(pwd)"/".vimrc ~/.vimrc
ln -s $(pwd)"/".Xresources ~/.Xresources

ln -s $(pwd)"/".w3m/config ~/.w3m/config
ln -s $(pwd)"/".w3m/keymap ~/.w3m/keymap
