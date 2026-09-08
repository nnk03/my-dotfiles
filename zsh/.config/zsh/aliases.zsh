# alias tmux='tmux -u'
# alias nautilus='GTK_THEME=Adwaita-dark GDK_BACKEND=x11 nautilus'
alias matplotlib-python3='QT_QPA_PLATFORM=xcb python3'
alias arduinoApp='~/.arduino-application-image/AppRun'
alias matlabApp='wmname compiz && /usr/local/bin/matlab'
alias godotApp='$HOME/.godotAppRun/Godot_v4.3-stable_linux.x86_64'
# alias notify-send='canberra-gtk-play -f $HOME/.config/mako/notification-sound.wav && /usr/bin/notify-send'


# ---- Eza (better ls) -----
alias els="/usr/bin/ls"
# alias ls="eza --icons=always"
alias la="eza --icons=always"
# alias els="eza --icons=always"

# ---- Zoxide (better cd) ----
# for arch
eval "$(zoxide init zsh)"
# alias cd="z"		# better to use cd and z separately

# alias gcc-11='gcc'
# alias cmake='/home/neeraj/.cmake-4.0.0/bin/cmake'
# alias ctest='/home/neeraj/.cmake-4.0.0/bin/ctest'
# alias cpack='/home/neeraj/.cmake-4.0.0/bin/cpack'

# interactive neovim search
alias inv='nvim $(fzf -m --preview="bat --color=always {}")'
alias lg='lazygit'
alias lo='lazydocker'

# -b is for old style of display
# -M is for "week starts on Monday"
alias ncal='ncal -b -M'
alias exit_code='echo $?'
# in bash it is, "${PIPESTATUS[@]}"
alias pipe_exit_code='echo "${pipestatus[@]}"'


# man using `bat` command
# also can be done by `export MANPAGER="bat -plman"`
# `bat -plman` same as `bat -p -l man`
alias bman='MANPAGER="bat -plman" man'

# Latex aliases
alias lt='latexmk'
alias ltc='latexmk -c'
alias ltC='latexmk -C'
