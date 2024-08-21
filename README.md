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
    chmod +x ~/.dotfiles/sh_files/install.sh
    chmod +x ~/.dotfiles/sh_files/variables.sh
    ~/.dotfiles/sh_files/install.sh
    ```
    Executing this script will create symbolic links to the dotfiles in your home directory and perform other necessary setup tasks.

3. **Configure Personal Details**:

    After making your changes, apply them by sourcing your shell configuration file:
    ```bash
    source ~/.zshrc
    ```

## Onboarding to Luma

1. Execute the following commands:

    ```bash
   ~/.dotfiles/sh_files/luma_onboarding.sh
    ```

## Usage

Once the dotfiles are installed, you can start using them with your tools. Here's how you can use some of the included dotfiles:

- `.mydotfile`: This dotfile performs functions X, Y, and Z. You can customize it by performing actions A, B, and C.

## Acknowledgments

- A special thanks to anyone whose code was utilized.
- Inspiration sources.
- etc.