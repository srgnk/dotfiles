# https://github.com/skwp/dotfiles/blob/master/zsh/0_path.zsh
pathAppend() {
	# Only adds to the path if it's not already there
	if ! echo $PATH | egrep -q "(^|:)$1($|:)" ; then
		export PATH="$1:$PATH"
	fi
}

# Remove duplicate entries from PATH:
PATH=$(echo "$PATH" | awk -v RS=':' -v ORS=":" '!a[$1]++{if (NR > 1) printf ORS; printf $a[$1]}')

# set PATH
pathAppend "$HOME/bin"
