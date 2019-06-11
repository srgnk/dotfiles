# Make vim the default editor
if which vim >/dev/null 2>&1; then
    alias vi="$( which vim )"
    export EDITOR="vim"
fi

# Enable colors for ls
export CLICOLOR=1

# Allow ANSI "color" escape sequences for less
export LESS="-R"

shopt -s nocaseglob     # Case-insensitive globbing (used in pathname expansion)
shopt -s extglob        # Turn on extended globbing
shopt -s cdspell        # Autocorrect typos in path names when using `cd`
shopt -s checkwinsize   # Check the window size after each command, and update LINES and COLUMNS if the size has changed

# fix the annoying bug with backspace while editing in VIM
[[ $- == *i* ]] && stty erase ^?

# SSH auto-completion based on entries in known_hosts.
if [[ -e ~/.ssh/known_hosts ]]; then
	complete -o default -W "$(cat ~/.ssh/known_hosts | sed 's/[, ].*//' | sort | uniq | grep -v '[0-9]')" ssh scp sftp
fi
