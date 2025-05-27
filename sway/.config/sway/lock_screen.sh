#!/bin/sh

# Credit to the following for comming up with this:
# https://code.krister.ee/lock-screen-in-sway/
# To Do: The fancier screen lock mentioned on that page might be cool to try.

# Times the screen off and puts it to background
swayidle -w \
	before-sleep 'loginctl lock-session $XDG_SESSION_ID' \
	lock 'swaylock -i $HOME/.config/sway/wallpaper.png' \
	timeout 600 $lock \
	timeout 570 'swaymsg "output * dpms off"' \
	resume 'swaymsg "output * dpms on"' \
	before-sleep $lock \
	swayidle \
	timeout 10 'swaymsg "output * dpms off"' \
	resume 'swaymsg "output * dpms on"' &

# Locks the screen immediately
swaylock -i $HOME/.config/sway/BlackWallpaper.jpg -c 550000

# Kills last background task so idle timer doesn't keep running
kill %%
