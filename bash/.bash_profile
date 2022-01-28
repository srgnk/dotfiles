# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

source "$HOME/.bashrc"

# poetry
export PATH="$HOME/.poetry/bin:$PATH"
