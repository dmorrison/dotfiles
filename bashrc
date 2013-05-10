source ~/.bash/aliases
# source ~/.bash/completions
source ~/.bash/paths
source ~/.bash/config

# initialize rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# use .localrc for settings specific to one system
if [ -f ~/.localrc ]; then
  source ~/.localrc
fi
