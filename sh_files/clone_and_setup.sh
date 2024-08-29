#!/bin/bash

# Check if the directory exists and prompt to overwrite it
~/.dotfiles/sh_files/check_and_overwrite.sh $1 "cloning of $1"

# If the directory does not exist or the user confirmed to overwrite it
if [ $? -eq 0 ]; then
    # Clone the repository
    git clone git@github.com:pagaya/$1.git $1
    # Change the current directory to the repository directory
    cd $1
else
    # Change the current directory to the repository directory
    cd $1
fi

# Use the default Python version
py_version=$DEFAULT_PYTHON_VERSION

# Prompt the user to change the Python version
read -p "The default Python version is $py_version. Do you want to change it for the repository $1? (y/n) " yn
if [[ $yn == [Yy]* ]]; then
    read -p "Enter the Python version to install: " py_version
fi

# If the Python version is not already installed, prompt the user for confirmation before installing it
if ! pyenv versions --bare | grep -q "^${py_version}$"; then
    read -p "Python version $py_version is not installed. Do you want to install it? (y/n) " yn
    if [[ $yn == [Yy]* ]]; then
        pyenv install $py_version
    fi
fi

# Set the Python version for the current directory
read -p "Do you want to set the Python version for the current directory to $py_version? (y/n) " yn
if [[ $yn == [Yy]* ]]; then
    pyenv local $py_version
fi

# Prompt the user to create a virtual environment
read -p "Do you want to create a virtual environment? (y/n) " yn
if [[ $yn == [Yy]* ]]; then
    # Check if the virtual environment exists and prompt to overwrite it
    ~/.dotfiles/sh_files/check_and_overwrite.sh venv "creation of virtual environment"
    # If the virtual environment does not exist or the user confirmed to overwrite it
    if [ $? -eq 0 ]; then
        # Create the virtual environment
        python -m venv venv
        echo -e "\033[0;32mVirtual environment created successfully.\033[0m"
        echo -e "\033[0;32mTo activate the virtual environment, run: source $PATH_TO_WORKSPACE_DIR/$1/venv/bin/activate\033[0m"
    fi
fi