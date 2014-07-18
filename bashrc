source ~/.bash/aliases
source ~/.bash/completions

# colors from http://wiki.archlinux.org/index.php/Color_Bash_Prompt
# misc
NO_COLOR='\e[0m' #disable any colors
# regular colors
BLACK='\e[0;30m'
RED='\e[0;31m'
GREEN='\e[0;32m'
YELLOW='\e[0;33m'
BLUE='\e[0;34m'
MAGENTA='\e[0;35m'
CYAN='\e[0;36m'
WHITE='\e[0;37m'
# emphasized (bolded) colors
EBLACK='\e[1;30m'
ERED='\e[1;31m'
EGREEN='\e[1;32m'
EYELLOW='\e[1;33m'
EBLUE='\e[1;34m'
EMAGENTA='\e[1;35m'
ECYAN='\e[1;36m'
EWHITE='\e[1;37m'
# underlined colors
UBLACK='\e[4;30m'
URED='\e[4;31m'
UGREEN='\e[4;32m'
UYELLOW='\e[4;33m'
UBLUE='\e[4;34m'
UMAGENTA='\e[4;35m'
UCYAN='\e[4;36m'
UWHITE='\e[4;37m'
# background colors
BBLACK='\e[40m'
BRED='\e[41m'
BGREEN='\e[42m'
BYELLOW='\e[43m'
BBLUE='\e[44m'
BMAGENTA='\e[45m'
BCYAN='\e[46m'
BWHITE='\e[47m'

# set Vim to be the default editor
export EDITOR="vi"
export VISUAL="vi"

# set up rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# add Bundler binstubs to $PATH _before_ rbenv (so I can use
# binstubbed rake, etc.)
export PATH=./vendor/bundle/binstubs:$PATH

# add utility folders to $PATH
export PATH=./bin:~/.bin:$PATH

# virtualenv settings
#export PIP_REQUIRE_VIRTUALENV=true # tell pip to only run if there is a virtualenv currently activated
#export PIP_RESPECT_VIRTUALENV=true # tell pip to install packages into the active virtualenv environment
#export VIRTUALENV_DISTRIBUTE=true  # tell virtualenv to use Distribute instead of legacy setuptools
#export VIRTUAL_ENV_DISABLE_PROMPT=true # tell virtualenv not to modify my prompt

# set a default virtualenv
#. ~/.virtualenvs/default/bin/activate

# turn off autossh's default monitoring (it will use the ssh client's
# monitoring instead - i.e. ServerAliveInterval and ServerAliveCountMax).
export AUTOSSH_PORT=0

# prompt stuff
# ==============
# REMEMBER TO USE \ IN FRONT OF $(...) TO UPDATE DYNAMICALLY!!
export PS1="\[$CYAN\]\w\[$NO_COLOR\] \$(vcprompt -f \"on \[$YELLOW\]%b\[$NO_COLOR\] \")with \[$RED\]\$(rbenv version | sed -e \"s/ (set.*$//\")\[$NO_COLOR\] → "

# to put virtualenv in prompt...
# \[$GREEN\]\$(virtualenvinfo)\[$NO_COLOR\]
# ==============

# use .localrc for settings specific to one system
if [ -f ~/.localrc ]; then
  source ~/.localrc
fi
