ZSH_DISABLE_COMPFIX=true

source ~/.dotfiles/sh_files/variables.sh

for DOTFILE in `find $HOME/.dotfiles/zsh_profile`
do
    [ -f "$DOTFILE" ] && source "$DOTFILE"
done

