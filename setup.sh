#!/usr/bin/bash

HOMEBREW_LINK='/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'

# For Debian/Ubuntu

sudo apt update -y
sudo apt upgrade -y
sudo apt install vim git zsh
sudo apt install zoxide

echo $HOMEBREW_LINK
