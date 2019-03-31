#!/bin/bash
#dotfiles/lndotfiles.sh

lnfiles() {
	for i in $(ls -A) ;do
		if [[ $i =~ ~$ ]]; then continue; fi
		if [[ $i =~ git ]]; then continue; fi
		if [[ $i =~ lndotfiles ]]; then continue; fi
		if [[ $i =~ req_pkg ]]; then continue; fi
		if [[ -f ${i} && -d ~/$1 && !(( -e ~/$1/${i} && -h ~/$1/${i} )) ]]; then
			echo "ln -s -i $(pwd)/${i} ~/$1/${i}"
			ln -s -i $(pwd)/${i} ~/$1/${i}
		elif [[ -d ${i} && -d ~/${i} ]]; then
			pushd ${i}
			lnfiles $1/${i}
			popd
		fi

	done;
}

lnfiles "."

exit

