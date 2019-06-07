# Ubuntu-like bash prompt
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# Only load Liquid Prompt in interactive shells, not from a script or from scp
[[ $- == *i* ]] && [[ -e "$HOME/liquidprompt" ]] && source "$HOME/liquidprompt/liquidprompt"
