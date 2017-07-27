[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

export PATH="/usr/local/bin:/usr/bin:$PATH"

# homebrew=/usr/local/bin:/usr/local/sbin
# export PATH=$homebrew:$PATH

# modify your PATH variable
export PATH="~/.local/bin:$PATH"

## You may need to manually set your language environment
export LANG=en_GB.UTF-8
# export LC_COLLATE=en_GB.UTF-8
# export LC_CTYPE=en_GB.UTF-8
# export LC_MESSAGES=en_GB.UTF-8
# export LC_MONETARY=en_GB.UTF-8
# export LC_NUMERIC=en_GB.UTF-8
# export LC_TIME=en_GB.UTF-8
export LC_ALL=en_GB.UTF-8

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# openssl
export PATH="/usr/local/opt/openssl/bin:$PATH"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# Setting PATH for Python 2.7
  # The original version is saved in .bash_profile.pysave
  PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
  export PATH=/usr/local/bin:$PATH

  # Setting PATH for Python 3.6
  # The original version is saved in .bash_profile.pysave
  PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
  export PATH=/usr/local/bin:$PATH

function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
