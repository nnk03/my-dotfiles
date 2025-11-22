
# On fedora

Use `sudo dnf copr enable <repo>?`

```
sudo dnf copr enable avengemedia/dms                                                                                ─╯
sudo dnf install niri dms
systemctl --user add-wants niri.service dms

```

# Man pages

Install man-db and man-pages and run `sudo mandb`
test it with `man malloc` `man atoi`

# To open all chrome tabs from another OS

`chrome://history/syncedTabs` and click `Open ALL`

if using firefox and vertical tab group will sometimes be in light mode
change the default theme to dark mode and use a theme extension
in `about:addons` ? with the theme name `Black Leader 3440 pixels`

[https://addons.mozilla.org/en-US/firefox/addon/black-leader-3440-pixels/](https://addons.mozilla.org/en-US/firefox/addon/black-leader-3440-pixels/)

# Multimonitor with lenovo-loq

because of nvidia-graphics

edit `GRUB_CMDLINE_LINUX_DEFAULT` to the below in `/etc/default/grub`

```

GRUB_CMDLINE_LINUX_DEFAULT="quiet splash nvidia-drm.modeset=1"

```

Then

Check what is the command for fedora
Below is just an example
```sh
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

```sh
sudo pacman -S mesa vulkan-intel intel-media-driver
sudo nano /etc/pacman.conf
```

# Configuration for my Linux Machine


check the help string of the following commands
Use [auto-install-packages.sh](./scripts/auto-install-packages.sh)
Use [dump-installed-packages.sh](./scripts/dump-installed-packages.sh)

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
