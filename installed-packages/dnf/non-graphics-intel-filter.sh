#!/usr/bin/env bash

grep -v -E '^(akmod-nvidia|kmod-nvidia|nvidia-|intel-)' ./dnf.packages > safe_packages.txt
