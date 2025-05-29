#!/bin/bash

stow alacritty
stow gitconfig
stow kitty
stow language-formatting-configuration
stow nvim
stow mako
stow sway
stow tmux
stow vim
stow waybar
stow wofi
stow yazi
stow zsh

echo "source ~/.config/zsh/.aliases.zsh" >>"~/.zshrc"
echo "source ~/.config/zsh/.options.zsh" >>"~/.zshrc"
