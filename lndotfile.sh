#!/bin/sh
#dotfiles/lndotfiles.sh

lnfiles() {
	for i in $(ls -A) ;do
		if [ $(echo ${i}|grep "~") ]; then continue; fi
		if [ $(echo ${i}|grep ".git") ]; then continue; fi
		if [ -f ${i} -a \( ! -e ~/$1/${i} -o ! -h ~/$1/${i} \) ]; then
			echo "ln -s -i $(pwd)/${i} ~/$1/${i}"
			ln -s -i $(pwd)/${i} ~/$1/${i}
		elif [ -d ${i} ]; then
			pushd ${i}
			lnfiles $1/${i}
			popd
		fi

	done;
}

lnfiles "."

exit

