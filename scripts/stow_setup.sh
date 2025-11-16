#!/bin/bash

# Check if stow is installed
if ! command -v stow &>/dev/null; then
	echo "Error: GNU Stow is not installed. Please install it and try again."
	exit 1
fi

# List of directories to stow
configs=(
	alacritty
	gitconfig
	kitty
	language-formatting-configuration
	nvim
	mako
	sway
	tmux
	vim
	waybar
	wofi
	yazi
	zsh
)

# Stow each config
for config in "${configs[@]}"; do
	stow "$config"
done

# Prompt to add source commands
echo "PRESS ENTER to add source commands to .zshrc file"
read

# Append source lines if they don't already exist
zshrc="$HOME/.zshrc"
aliases_line='source ~/.config/zsh/.aliases.zsh'
options_line='source ~/.config/zsh/.options.zsh'

grep -qxF "$aliases_line" "$zshrc" || echo "$aliases_line" >>"$zshrc"
grep -qxF "$options_line" "$zshrc" || echo "$options_line" >>"$zshrc"
