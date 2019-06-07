# History size
export HISTSIZE=100000
export HISTFILESIZE=1000000

# Ignore duplicates in bash history
export HISTCONTROL=ignoredups

# Make some commands not show up in history
export HISTIGNORE="ls:cd:cd -:pwd:exit:date"

# Give history timestamps.
export HISTTIMEFORMAT="[%F %T] "

# Save each command right after it has been executed, not at the end of the session
export PROMPT_COMMAND='history -a'

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Use UP and DOWN arrows to search history
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
