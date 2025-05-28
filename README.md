# Configuration for my Linux Machine

Use GNU Stow (except for powerlevel10k and swaylock and fonts)

`cd` to this dotfiles directory and

```sh
stow nvim # for nvim configuration
stow tmux # for tmux configuration
stow alacritty # for alacritty configuration
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
