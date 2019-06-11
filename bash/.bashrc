# modularize bash config just like in https://github.com/xero/dotfiles

for config in $HOME/.bash/*.sh ; do
    source $config
done
unset config
