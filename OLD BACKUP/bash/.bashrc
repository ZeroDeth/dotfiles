# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.

# openssl
export PATH="/usr/local/opt/openssl/bin:$PATH"
# export PATH="$PATH:/usr/local/Cellar/openssl/1.0.2h/bin/openssl"

# sqlite
export PATH="/usr/local/opt/sqlite/bin:$PATH"

export PATH="/usr/local/bin:/usr/bin:$PATH"

# Bash Completion on OS X With Brew
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python2
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
export WORKON_HOME=~/.environment
source /usr/local/bin/virtualenvwrapper.sh

# AWS CLI Command Completion
complete -C '/usr/local/aws/bin/aws_completer' aws
export PATH=/usr/local/aws/bin:$PATH

# To run gitignore.io from your command line you need an active internet connection and an environment function. You need to add a function to your environment that lets you access the gitignore.io API.
function gi() { curl -L -s https://www.gitignore.io/api/\$@ ;}

# Docker Command Completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi

source <(kubectl completion bash)
# setup Kubectl Autocomplete in bash, bash-completion package should be installed first.

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
