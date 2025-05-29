POWERLEVEL10K_RIGHT_PROMPT_ELEMENTS=(status virtualenv)

plugins=(
    git 
    zsh-autosuggestions 
    zsh-syntax-highlighting 
    web-search
    virtualenv
)

# for separating history
unsetopt inc_append_history
unsetopt share_history

export EDITOR='vim'
export VISUAL='vim'

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
. "$HOME/.cargo/env"


# for screensharing
export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_TYPE=wayland
export QT_QPA_PLATFORM=wayland
export SDL_VIDEODRIVER=wayland

bindkey '^ ' autosuggest-accept
bindkey '^o' clear-screen


export PATH="$HOME/.nvim-linux-x86_64/bin/./:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
# export PATH="$HOME/.alacritty/target/release:$PATH"
# alacritty can be installed using sudo apt in ubuntu 24.04



# source /home/neeraj/anaconda3/bin/activate base
# conda deactivate

# Created by `pipx` on 2024-08-07 12:04:55
export PATH="$PATH:/home/neeraj/.local/bin"


# For CUDA
export PATH=/usr/local/cuda-12.6/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-12.6/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

# For Go
export PATH=$PATH:/usr/local/go/bin



# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

source $HOME/.venv/bin/activate

# for networkx directory alone 
if [[ $(pwd) == "$HOME/btp/networkx"* ]]; then
   source "$HOME/btp/networkx/networkx-dev/bin/activate"
fi

if [[ $(pwd) == "$HOME/Desktop/learning/ml/kaggle-titanic"* ]]; then
   source "$HOME/Desktop/learning/ml/kaggle-titanic/.kaggle/bin/activate"
fi

export GUROBI_HOME="/opt/gurobi/linux64"
export PATH="${GUROBI_HOME}/bin:$PATH"
export LD_LIBRARY_PATH="${GUROBI_HOME}/lib:$LD_LIBRARY_PATH"
export GRB_LICENSE_FILE="$HOME/gurobi.lic"


# for yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}


