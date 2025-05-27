#! /bin/bash

swayidle -w \
    timeout 10 'swaylock -i $HOME/.config/sway/ubuntu_wallpaper.png' \
    timeout 7 'swaymsg "output * dpms off"' \
    resume 'swaymsg "output * dpms on"' \
    before-sleep 'swaylock -i $HOME/.config/sway/ubuntu_wallpaper.png'



