#!/bin/sh
#dotfiles/lndotfiles.sh

dotfiles=$(ls -A)

for i in dotfiles; do
	if [ "/"$i != $0 ]; then 
		ln -sF $(pwd)"/"$i ~/$i
	fi
done
