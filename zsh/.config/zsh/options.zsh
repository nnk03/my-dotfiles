POWERLEVEL10K_RIGHT_PROMPT_ELEMENTS=(status virtualenv)

plugins=(
    git 
    # zsh-autosuggestions 
    zsh-syntax-highlighting 
    web-search
    virtualenv
)

# for separating history
unsetopt inc_append_history
unsetopt share_history

export EDITOR='vim'
export VISUAL='vim'

# opencode
export PATH=/home/neeraj/.opencode/bin:$PATH
export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"

# Neovim
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
if command -v nvim > /dev/null ; then
   export VISUAL=nvim
   export EDITOR=nvim
fi

# eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
# . "$HOME/.cargo/env"


# for screensharing
# export XDG_CURRENT_DESKTOP=sway
# export XDG_SESSION_TYPE=wayland
# export QT_QPA_PLATFORM=wayland
# export SDL_VIDEODRIVER=wayland

# bindkey '^ ' autosuggest-accept
bindkey '^o' clear-screen


# export PATH="$HOME/.nvim-linux-x86_64/bin/./:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:$HOME/.local/bin"
# export PATH="$HOME/.alacritty/target/release:$PATH"
# alacritty can be installed using sudo apt in ubuntu 24.04



# source /home/neeraj/anaconda3/bin/activate base
# conda deactivate

# Created by `pipx` on 2024-08-07 12:04:55
# export PATH="$PATH:/home/neeraj/.local/bin"


# For CUDA
# export PATH=/usr/local/cuda-12.6/bin${PATH:+:${PATH}}
# export LD_LIBRARY_PATH=/usr/local/cuda-12.6/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

# For Go
# export PATH=$PATH:/usr/local/go/bin



# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# source $HOME/.venv/bin/activate

# for networkx directory alone 
# if [[ $(pwd) == "$HOME/btp/networkx"* ]]; then
#    source "$HOME/btp/networkx/networkx-dev/bin/activate"
# fi
#
# if [[ $(pwd) == "$HOME/Desktop/learning/ml/kaggle-titanic"* ]]; then
#    source "$HOME/Desktop/learning/ml/kaggle-titanic/.kaggle/bin/activate"
# fi

# export GUROBI_HOME="/opt/gurobi/linux64"
# export PATH="${GUROBI_HOME}/bin:$PATH"
# export LD_LIBRARY_PATH="${GUROBI_HOME}/lib:$LD_LIBRARY_PATH"
# export GRB_LICENSE_FILE="$HOME/gurobi.lic"


# for yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

setopt HIST_IGNORE_SPACE

[ -f "/home/neeraj/.ghcup/env" ] && . "/home/neeraj/.ghcup/env" # ghcup-env

# source /usr/share/nvm/init-nvm.sh

function sesh-sessions() {
  {
    exec </dev/tty
    exec <&1
    local session
    session=$(sesh list -t -c | fzf --height 40% --reverse --border-label ' sesh ' --border --prompt '⚡  ')
    zle reset-prompt > /dev/null 2>&1 || true
    [[ -z "$session" ]] && return
    sesh connect $session
  }
}

zle     -N             sesh-sessions
bindkey -M emacs '\es' sesh-sessions
bindkey -M vicmd '\es' sesh-sessions
bindkey -M viins '\es' sesh-sessions

# Save open PDFs using lsof (handles spaces and long file paths)
zathura-save() {
  local session_file="${1:-$HOME/.zathura_session}"
  lsof -c zathura 2>/dev/null | grep -i '\.pdf$' | awk '{$1=$2=$3=$4=$5=$6=$7=$8=""; print substr($0, 9)}' > "$session_file"
  echo "Saved $(wc -l < "$session_file") PDF(s) to $session_file"
}

zathura-restore() {
  local session_file="${1:-$HOME/.zathura_session}"

  if [[ ! -f "$session_file" ]]; then
    echo "Session file not found: $session_file"
    return 1
  fi

  # Get currently open files into a temporary list
  local currently_open
  currently_open="$(lsof -c zathura 2>/dev/null | grep -i '\.pdf$' | awk '{$1=$2=$3=$4=$5=$6=$7=$8=""; print substr($0, 9)}')"

  while IFS= read -r file; do
    [[ -z "$file" || ! -f "$file" ]] && continue

    # Check if the file path is already in the running instances list
    if echo "$currently_open" | grep -Fqx "$file"; then
      echo "Skipping already open: $file"
    else
      zathura "$file" &>/dev/null &
    fi
  done < "$session_file"
}
