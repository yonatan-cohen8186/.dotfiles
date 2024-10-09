# Dotfiles

This repository houses my personal dotfiles, which are the foundational configuration files for the systems and tools I use daily.

## Getting Started

Follow these instructions to obtain a copy of my dotfiles and set them up on your local machine.

### Prerequisites

Before proceeding with the installation, ensure you have Git installed on your machine as it is required for cloning the repository.

### Installation

Follow these step-by-step instructions to set up a development environment:

1. **Clone the Repository**: Clone this repository to your local machine. I prefer to keep it in a folder named "dotfiles" in my home directory:
    ```bash
    cd ~
    git clone git@github.com:yonatan-cohen8186/.dotfiles.git
    ```

2. **Execute the Installation Script**: 

   First, modify the file `~/dotfiles/sh_files/variables.sh` to include your personal details and preferences. This file may contain settings or environment variables that are specific to your setup.
   
   Before running the scripts, we need to ensure they have the necessary permissions. We use the `chmod` command to change the permissions of the files. The `+x` option makes the files executable.
   ```bash
    chmod +x ~/.dotfiles/sh_files/*.sh
    ~/.dotfiles/sh_files/install.sh
    ```
    Executing this script will create symbolic links to the dotfiles in your home directory and perform other necessary setup tasks.

3. **Run Make Commands**: After navigating to the `.dotfiles` directory, run the following make commands to set up various tools and configurations:
    ```bash
    cd ~/.dotfiles
    make brew
    make vim
    make oh-my-zsh
    ```
    This will install Homebrew, Vim, and Oh My Zsh, and their respective packages and dependencies.

4. **Configure Personal Details**:

    After making your changes, apply them by sourcing your shell configuration file:
    ```bash
    source ~/.zshrc
    ```

## Onboarding to Luma

1. Execute the following command to set up the Luma environment:
    ```bash
    make luma_onboarding
    ```
    This command will clone and set up various internal tools and repositories needed for Luma.

## Usage

Once the dotfiles are installed, you can start using them with your tools. Here are examples of how to use some of the included dotfiles:

- **`.zshrc`**: This configuration file customizes the Zsh shell. After installation, it will automatically be sourced when you open a terminal. You can add aliases, environment variables, and custom functions here. To apply changes immediately after editing, run:
    ```bash
    source ~/.zshrc
    ```

- **`.vimrc`**: This file configures Vim. It includes settings for appearance, keybindings, and plugins. To use the configurations, simply open Vim. If you make changes to `.vimrc`, they will be applied the next time you start Vim. To apply them immediately within Vim, run:
    ```vim
    :source ~/.vimrc
    ```

- **`aliases.sh`**: This file can contain custom shell aliases. For example:
    ```bash
    alias gst="git status"
    alias ll="ls -la"
    ```
    After modifying this file, ensure it is sourced in your main shell configuration file (like `.zshrc`) to make the aliases available:
    ```bash
    source ~/.aliases.sh
    ```

## Acknowledgments

- A special thanks to anyone whose code was utilized.
- Inspiration sources.
- etc.