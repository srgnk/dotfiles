# Make vim the default editor
if which vim >/dev/null 2>&1; then
    alias vi="$( which vim )"
    export EDITOR="vim"
fi

# Enable colors for ls
export CLICOLOR=1

# Allow ANSI "color" escape sequences for less
export LESS="-R"

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob
# Turn on extended globbing
shopt -s extglob

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Check the window size after each command, and update LINES and COLUMNS if the size has changed
shopt -s checkwinsize

# fix the annoying bug with backspace while editing in VIM
[[ $- == *i* ]] && stty erase ^?

# SSH auto-completion based on entries in known_hosts.
if [[ -e ~/.ssh/known_hosts ]]; then
	complete -o default -W "$(cat ~/.ssh/known_hosts | sed 's/[, ].*//' | sort | uniq | grep -v '[0-9]')" ssh scp sftp
fi
