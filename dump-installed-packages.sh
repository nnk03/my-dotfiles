#!/usr/bin/env bash

# paru is preferred than yay

files=(
	./pacman_with_version.txt
	./pacman_without_version.txt
	./paru_with_version.txt
	./paru_without_version.txt
)

# create backups of existing packages
for testFile in "${files[@]}"
do
	if [[ -f $testFile ]]; then
		mv "$testFile" "$testFile.bak"
	fi
done



pacman -Qe > pacman_with_version.txt
paru -Qe > paru_with_version.txt
pacman -Qq > pacman_without_version.txt
paru -Qq > paru_without_version.txt
