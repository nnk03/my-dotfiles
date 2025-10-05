#!/usr/bin/env bash

pacman -Qe > pacman_with_version.txt
yay -Qe > yay_with_version.txt
pacman -Qe | awk ' { print $1 } ' > pacman_without_version.txt
yay -Qe | awk ' { print $1 } ' > yay_without_version.txt

