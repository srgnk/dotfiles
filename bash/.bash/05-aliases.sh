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
alias gcm='git checkout master || git checkout main'
alias gcb='git checkout -b'
alias gc='git switch'
alias gs='git status'
alias gp='git pull'
alias gl='git l'
alias gbv='git branch -v'
alias gd='git diff'
alias gr='git restore --'

# vim
alias invim='env | grep vim'

# python aliases
alias pip-reinstall='pip3 install --force-reinstall -r ../requirements/local.txt'
alias pip-upgrade-pip='python -m pip install --upgrade pip'

# django aliases
alias manage='python manage.py'
alias manage-makemigrations='python manage.py makemigrations'
alias manage-migrate='python manage.py migrate'
alias manage-test='python manage.py test'
alias manage-test-full='SUITE=FULL python manage.py test'
alias manage-runserver='python manage.py runserver'

# circleci
alias validate-circleci-config='circleci config validate ../.circleci/config.yml'
