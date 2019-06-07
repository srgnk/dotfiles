#
# Execution order for .bashrc and .profile for /bin/bash:
#
#                          redhat/sles        osx/ubuntu
# Login shell       ~/.bashrc,~/.profile      ~/.profile
# Non-login shell         ~/.bashrc           ~/.bashrc
#

# inspired by Mathias Bynens' dotfiles (https://github.com/mathiasbynens/dotfiles)

# Add custom bin folder to PATH
[ -d "${HOME}/bin" ] && export PATH="$HOME/bin:$PATH"

# Ubuntu-like bash prompt
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# Make vim the default editor
if which vim >/dev/null 2>&1; then
    alias vi="$( which vim )"
    export EDITOR="vim"
fi

# History size
HISTFILESIZE=10000

# Ignore duplicates in bash history
HISTCONTROL=ignoredups

# Make some commands not show up in history
HISTIGNORE="ls:cd:cd -:pwd:exit:date"

# Enable colors for ls
export CLICOLOR=1
alias ls="ls --color=auto"

# Enable colors for grep
export GREP_OPTIONS="--color=auto"

# Allow ANSI "color" escape sequences for less
export LESS="-R"

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Save each command right after it has been executed, not at the end of the session
PROMPT_COMMAND='history -a'

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

#
shopt -s checkwinsize

# If possible, add tab completion for many more commands
[ -f /etc/bash_completion ] && . /etc/bash_completion
[ -f ~/.bash_completion ] && . ~/.bash_completion

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# fix the annoying bug with backspace while editing in VIM
[[ $- == *i* ]] && stty erase ^?

[[ -e "$HOME/.aliases" ]] && source "$HOME/.aliases"
[[ -e "$HOME/.bashrc_local" ]] && source "$HOME/.bashrc_local"

# Only load Liquid Prompt in interactive shells, not from a script or from scp
[[ $- == *i* ]] && [[ -e "$HOME/liquidprompt" ]] && source "${HOME}/liquidprompt/liquidprompt"
