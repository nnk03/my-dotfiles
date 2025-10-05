# Arch install script + dual boot video link

[https://youtu.be/mWl4P6DOt9M?si=U_XNuPlwfXEiJDI0](https://youtu.be/mWl4P6DOt9M?si=U_XNuPlwfXEiJDI0)

Install necessary nvidi and intel drivers using `Additional Packages`

# for lsp error

```
LSP] Format request failed, no matching language servers.
              [LSP] Format request failed, no matching language servers.
                      [null-ls] failed to run generator: ....local/share/nvim/lazy/none-ls.nvim/lua/null-ls/loop.lua:165: command prettier is not executable (make sure it's installed and on your $PATH)

```

```sh
npm install -g prettier

```

# for hyprland in arch

[https://youtu.be/2CP_9-jCV6A?si=OOMukqO3WglVdpYd](https://youtu.be/2CP_9-jCV6A?si=OOMukqO3WglVdpYd)
[https://youtu.be/KA1jv40q9lQ?si=abGV9ojKdYda5cxz](https://youtu.be/KA1jv40q9lQ?si=abGV9ojKdYda5cxz)
[https://youtu.be/omhJMH9lPPc?si=gFUZV_qSo11wY1nW](https://youtu.be/omhJMH9lPPc?si=gFUZV_qSo11wY1nW)

# Multimonitor with lenovo-loq

because of nvidia-graphics

edit `GRUB_CMDLINE_LINUX_DEFAULT` to the below in `/etc/default/grub`

```

GRUB_CMDLINE_LINUX_DEFAULT="quiet splash nvidia-drm.modeset=1"

```

Then

```sh
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

```sh
sudo pacman -S mesa vulkan-intel intel-media-driver
sudo nano /etc/pacman.conf
```

Uncomment the lines for [multilib]:

```
[multilib]
Include = /etc/pacman.d/mirrorlist

```

```sh
sudo pacman -Syu
sudo pacman -S nvidia-dkms nvidia-utils lib32-nvidia-utils egl-wayland
```

```sh
sudo pacman -S intel-ucode
sudo pacman -S nvidia nvidia-utils
sudo pacman -S nvidia-lts # if linux-ltx is installed

```

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
