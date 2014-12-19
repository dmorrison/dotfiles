#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

unsetopt sharehistory
setopt incappendhistory

alias bi="bundle install --binstubs .bundle/bin --jobs 6 --clean"
alias bu="brew update && brew upgrade && brew cleanup && brew doctor"
alias vi="vim"
