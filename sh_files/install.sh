#!/bin/bash

source ~/.dotfiles/sh_files/variables.sh

# Function to create a symlink with a confirmation prompt
create_symlink() {
    local target="$1"
    local link_name="$2"

    ~/.dotfiles/sh_files/check_and_overwrite.sh "$link_name" "symlink $link_name"

    if [ $? -eq 0 ]; then
        ln -s "$target" "$link_name"
        echo "Created symlink: $link_name -> $target"
    fi

    if [[ "$link_name" == *".gitconfig" ]]; then
        git config --global user.name "$GIT_USER_NAME"
        git config --global user.email "$GIT_USER_EMAIL"
    fi
}

# Symlink setup
create_symlink "$HOME/.dotfiles/.zshrc" "$HOME/.zshrc"
create_symlink "$HOME/.dotfiles/mytheme.zsh-theme" "$HOME/.oh-my-zsh/custom/themes/mytheme.zsh-theme"
create_symlink "$HOME/.dotfiles/git_files/.gitconfig" "$HOME/.gitconfig"
create_symlink "$HOME/.dotfiles/git_files/.gitignore_global" "$HOME/.gitignore_global"

echo "Installation complete."