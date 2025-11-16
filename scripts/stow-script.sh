#!/usr/bin/env bash

set -x

configs=(
	alacritty
	backgrounds
	fastfetch
	ghostty
	gitconfig
	hyprland
	hyprlock
	hyprmocha
	hyprpaper
	kitty
	language-formatting-configuration
	nvim
	sway
	swaync
	tmux
	vim
	walker
	waybar
	wofi
	yazi
	zsh
)

for config in "${configs[@]}"; do
	stow $config
done
