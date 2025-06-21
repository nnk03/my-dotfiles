# Configuration for my Linux Machine

First use `my-linux` repo to run the `setup.sh` script and then
run the `stow_setup.sh`

Run `./install_packages.sh` to install all necessary packages

Use GNU Stow (except for powerlevel10k and swaylock and fonts)

For tmux, first clone tmux plugin manager

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

```

`cd` to this dotfiles directory and

```sh
stow nvim # for nvim configuration
stow tmux # for tmux configuration
stow alacritty # for alacritty configuration
stow zsh # for zsh configuration
```

For tmux run the below

```sh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

for terminal, currently using alacritty

copy the `.fonts` file and set up Meslo LGS Nerd Font Mono

install powerlevel 10k

install ohmyzsh

if `kitty` terminal is preferred use that with necessary configuration

some changes were done in ~/.p10k.zsh

```

  ##################################[ dir: current directory ]##################################
  # Current directory background color.
  typeset -g POWERLEVEL9K_DIR_BACKGROUND=4
  # Default current directory foreground color.
  typeset -g POWERLEVEL9K_DIR_FOREGROUND=0
  # If directory is too long, shorten some of its segments to the shortest possible unique
  # prefix. The shortened directory can be tab-completed to the original.
  typeset -g POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_unique
  # Replace removed segment suffixes with this symbol.
  typeset -g POWERLEVEL9K_SHORTEN_DELIMITER=
  # Color of the shortened directory segments.
  typeset -g POWERLEVEL9K_DIR_SHORTENED_FOREGROUND=250
  # Color of the anchor directory segments. Anchor segments are never shortened. The first
  # segment is always an anchor.
  typeset -g POWERLEVEL9K_DIR_ANCHOR_FOREGROUND=0
  # Display anchor directory segments in bold.
  typeset -g POWERLEVEL9K_DIR_ANCHOR_BOLD=true

```

For gnome-like-sway, checkout my-linux repo for the readme

Install `tldr` package using apt

# For installing NVM - Node Version Manager

[Github Repo](https://github.com/nvm-sh/nvm)
