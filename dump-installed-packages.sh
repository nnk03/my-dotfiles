#!/usr/bin/env bash

# paru is preferred than yay

pacman -Qe > pacman_with_version.txt
paru -Qe > yay_with_version.txt
pacman -Qe | awk ' { print $1 } ' > pacman_without_version.txt
paru -Qe | awk ' { print $1 } ' > yay_without_version.txt

