mkdir -p ~/.vim/colors
cd ~/.dotfiles/vim/colors
for COLOR in *
do
    [ -f "$COLOR" ] && ln -s "$COLOR" ~/.vim/colors/"$COLOR"
done
