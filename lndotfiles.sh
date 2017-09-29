#!/bin/bash
#dotfiles/lndotfiles.sh

lnfiles() {
	for i in $(ls -A) ;do
		if [ $(echo ${i}|grep "~") ]; then continue; fi
		if [ $(echo ${i}|grep ".git") ]; then continue; fi
		if [ $(echo ${i}|grep "lndotfiles") ]; then continue; fi
		if [ $(echo ${i}|grep "req_pkg") ]; then continue; fi
		if [ -f ${i} -a -d ~/$1 -a \( ! -e ~/$1/${i} -o ! -h ~/$1/${i} \) ]; then
			echo "ln -s -i $(pwd)/${i} ~/$1/${i}"
			ln -s -i $(pwd)/${i} ~/$1/${i}
		elif [ -d ${i} -a -d ~/${i} ]; then
			pushd ${i}
			lnfiles $1/${i}
			popd
		fi

	done;
}

lnfiles "."

exit

