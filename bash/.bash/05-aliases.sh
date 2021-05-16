# dotfiles
alias rebash='. ~/.bashrc'

# navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# ls
alias la='ls -la'
alias ll='ls -l'
alias lah='ls -lah'
alias latr='ls -latr'

# grep
alias grep='grep --color=auto'

# apt
alias sapt='sudo apt'

# du
alias du_largest='du -sh -- * | sort -h'

# git aliases
alias gcm='git checkout master'
alias gcb='git checkout -b'
alias gc='git checkout'
alias gs='git status'
alias gp='git pull'
alias gl='git l'
alias gbv='git branch -v'
alias gd='git diff'

# vim
alias invim='env | grep vim'
