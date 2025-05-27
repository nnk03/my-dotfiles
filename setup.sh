#!/usr/bin/bash

HOMEBREW_LINK='/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'

# For Debian/Ubuntu

sudo apt update -y
sudo apt upgrade -y
sudo apt install vim git zsh

echo "PRESS ENTER TO INSTALL zoxide"
read
sudo apt install zoxide

echo "PRESS ENTER TO INSTALL homebrew"
read

eval $HOMEBREW_LINK
