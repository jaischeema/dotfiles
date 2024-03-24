export ZSH=$HOME/.oh-my-zsh

DEFAULT_USER="jais"
ZSH_THEME="agnoster"

plugins=(brew git history-substring-search rust)

source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export N_PREFIX="$HOME/.n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"

. /opt/homebrew/etc/profile.d/z.sh

eval "$(rbenv init - zsh)"

