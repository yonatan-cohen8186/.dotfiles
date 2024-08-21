#!/bin/bash

# Function to create a symlink with a confirmation prompt
create_symlink() {
    local target="$1"
    local link_name="$2"

    if [ -L "$link_name" ]; then
        echo "Link $link_name already exists."
        read -p "Do you want to overwrite it? (y/n) " choice
        case "$choice" in
            y|Y )
                echo "Overwriting $link_name."
                ln -sf "$target" "$link_name"
                ;;
            n|N )
                echo "Skipping $link_name."
                ;;
            * )
                echo "Invalid choice. Skipping $link_name."
                ;;
        esac
    else
        ln -s "$target" "$link_name"
        echo "Created symlink: $link_name -> $target"
    fi
}

# Symlink setup
create_symlink "$HOME/.dotfiles/.zshrc" "$HOME/.zshrc"
create_symlink "$HOME/.dotfiles/mytheme.zsh-theme" "$HOME/.oh-my-zsh/custom/themes/mytheme.zsh-theme"
create_symlink "$HOME/.dotfiles/git_files/.gitconfig" "$HOME/.gitconfig"
create_symlink "$HOME/.dotfiles/git_files/.gitignore_global" "$HOME/.gitignore_global"

echo "Installation complete."