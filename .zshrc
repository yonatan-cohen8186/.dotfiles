ZSH_DISABLE_COMPFIX=true

for DOTFILE in `find $HOME/.dotfiles/zsh_profile`
do
    [ -f "$DOTFILE" ] && source "$DOTFILE"
done

