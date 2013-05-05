source ~/.bash/aliases
# source ~/.bash/completions
source ~/.bash/paths
source ~/.bash/config

# [[ -s "/Users/Derek/.rvm/scripts/rvm" ]] && source "/Users/Derek/.rvm/scripts/rvm"  # This loads RVM into a shell session.

# use .localrc for settings specific to one system
if [ -f ~/.localrc ]; then
  source ~/.localrc
fi
