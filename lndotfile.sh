#!/bin/sh
#dotfiles/lndotfiles.sh

ln -sF $(pwd)"/".bashrc ~/.bashrc
ln -sF $(pwd)"/".bash_aliases ~/.bash_aliases
ln -sF $(pwd)"/".bash_funcs ~/.bash_funcs
ln -sF $(pwd)"/".vimrc ~/.vimrc
ln -sF $(pwd)"/".Xresources ~/.Xresources

