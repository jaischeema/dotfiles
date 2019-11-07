export PATH="/usr/local/bin:/usr/local/heroku/bin:$HOME/.local/bin:$HOME/.yarn/bin:$HOME/.cargo/bin:$PATH"
export EDITOR="nvim"
export ERL_AFLAGS="-kernel shell_history enabled"

# This will open files at the specified line in vim if the last argument
# matches filename:line. E.g. app/models/user.rb:123
function v() {
  last_arg="${@: -1}"

  parts=("${(s/:/)last_arg}")
  file=$parts[1]
  line_number=$parts[2]

  if [[ $line_number -gt 0 ]]; then
    nvim "+$line_number" "$file"
  else
    nvim $@
  fi
}

alias ag="rg"
alias gt="git log --graph --format=format:'%c(bold blue)%h%c(reset) - %c(bold green)(%ar)%c(reset) %c(white)%s%c(reset) %c(bold white)— %an%c(reset)%c(bold yellow)%d%c(reset)' --abbrev-commit --date=relative"
alias vim="nvim"
alias vv="nvim"
alias gtop='until [ "$pwd" = / -o -d .git ]; do cd ..; done'
alias gcleanmerged="git checkout master && git branch --merged | grep -v \\* | xargs git branch -d"
alias ts="tig status"
alias gh="git config remote.origin.url | sed -en 's/git@github\.com\:([^\/]*)\/(.*)\.git/https\:\/\/github.com\/\1\/\2/p' | xargs open"
alias ghp="git config remote.origin.url | sed -en 's/git@github\.com\:([^\/]*)\/(.*)\.git/https\:\/\/github.com\/\1\/\2\/pulls/p' | xargs open"
alias hl="hledger"

source "$HOME/.zshenv_private"
