export ZSH=$HOME/.oh-my-zsh

DEFAULT_USER="jais"
ZSH_THEME="agnoster"

plugins=(brew cargo gem git heroku history-substring-search bundler zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(rbenv init -)"
export N_PREFIX="$HOME/.n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"
