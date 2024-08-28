# oh-my-zsh
export ZSH="/Users/mikber/.oh-my-zsh"
ZSH_THEME=""
HIST_STAMPS="yyyy-mm-dd"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting pass kubectl)
source ${ZSH}/oh-my-zsh.sh

# Edit mode
set -o vi

export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
  export VISUAL='vim'
else
  export EDITOR='nvim'
  export VISUAL='nvim'
fi

export BRAINHUB="$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/brain-hub"

# aliases
alias bh='cd ${BRAINHUB}'
alias in='cd ${BRAINHUB}/0-inbox'
alias dotfiles='/usr/bin/git --git-dir=${HOME}/.dotfiles/ --work-tree=${HOME}'

# PATH for the Google Cloud SDK
if [ -f '/Users/mikber/Downloads/google-cloud-sdk/path.zsh.inc' ]; then
  . '/Users/mikber/Downloads/google-cloud-sdk/path.zsh.inc'
fi

# shell command completion for gcloud
if [ -f '/Users/mikber/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then
  . '/Users/mikber/Downloads/google-cloud-sdk/completion.zsh.inc'
fi

# More Google Cloud SDK stuff
export USE_GKE_GCLOUD_AUTH_PLUGIN=True
export CLOUDSDK_PYTHON_SITEPACKAGES=1
export CLOUDSDK_PYTHON=python3.12

# Add go bin to path
export PATH=${PATH}:~/go/bin

# starship
# Check that the function `starship_zle-keymap-select()` is defined.
# xref: https://github.com/starship/starship/issues/3418
type starship_zle-keymap-select >/dev/null || \
  {
    eval "$(starship init zsh)"
  }
