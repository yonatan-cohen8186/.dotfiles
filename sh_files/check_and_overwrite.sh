#!/bin/bash

if [ -d "$1" ] || [ -f "$1" ]; then
    read -p "$1 already exists. Do you want to overwrite it? (y/n) " yn
    case $yn in
        [Yy]* ) rm -rf $1; exit 0;;
        * ) echo "Skipping $2"; exit 1;;
    esac
else
    exit 0
fi