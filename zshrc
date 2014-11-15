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

#bindkey '^[[A' up-line-or-local-history
#bindkey '^[[B' down-line-or-local-history
#
#up-line-or-local-history() {
#    zle set-local-history 1
#    zle up-line-or-history
#    zle set-local-history 0
#}
#zle -N up-line-or-local-history
#down-line-or-local-history() {
#    zle set-local-history 1
#    zle down-line-or-history
#    zle set-local-history 0
#}
#zle -N down-line-or-local-history
