# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

## zsh tmux settings
ZSH_TMUX_AUTOSTART='true'

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"

# (this is one of the fancy ones)
# you might need to install a special Powerline font on your console's host for this to work
# see https://github.com/robbyrussell/oh-my-zsh/wiki/Themes#agnoster
# ZSH_THEME="agnoster"

## (...please let it be pie... please be some pie..)
# ZSH_THEME="random"

## oh-my-zsh Powerline style Theme
# ZSH_THEME="powerline"

## Powerline Settings
# POWERLINE_GIT_CLEAN="✔"
# POWERLINE_GIT_DIRTY="✘"
# POWERLINE_GIT_ADDED="%F{green}✚%F{black}"
# POWERLINE_GIT_MODIFIED="%F{blue}✹%F{black}"
# POWERLINE_GIT_DELETED="%F{red}✖%F{black}"
# POWERLINE_GIT_UNTRACKED="%F{yellow}✭%F{black}"
# POWERLINE_GIT_RENAMED="➜"
# POWERLINE_GIT_UNMERGED="═"

## oh-my-zsh Powerlevel9k style Theme
# POWERLEVEL9K_MODE='awesome-fontconfig'
POWERLEVEL9K_MODE='awesome-patched'
ZSH_THEME="powerlevel9k/powerlevel9k"

# POWERLEVEL9K_IP_INTERFACE='en0'
# POWERLEVEL9K_PUBLIC_IP_HOST='http://ident.me'

## Powerlevel9k Settings
POWERLEVEL9K_NODE_VERSION_BACKGROUND='28'
POWERLEVEL9K_NODE_VERSION_FOREGROUND='15'
POWERLEVEL9K_BACKGROUND_JOBS_ICON=''
POWERLEVEL9K_VCS_STAGED_ICON='\u00b1'
POWERLEVEL9K_VCS_UNTRACKED_ICON='\u25CF'
POWERLEVEL9K_VCS_UNSTAGED_ICON='\u00b1'
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON='\u2193'
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON='\u2191'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='yellow'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='yellow'
POWERLEVEL9K_STATUS_OK_BACKGROUND="black"
POWERLEVEL9K_STATUS_OK_FOREGROUND="green"
POWERLEVEL9K_STATUS_ERROR_BACKGROUND="black"
POWERLEVEL9K_STATUS_ERROR_FOREGROUND="red"
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M  \uE868  %d.%m.%y}"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status background_jobs root_indicator context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(virtualenv nvm load ram rbenv time)
POWERLEVEL9K_CHANGESET_HASH_LENGTH=6
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=4
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX=" ❯ "
##

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
fpath=(~/.zsh/completion $fpath)

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git git-flow brew npm extract battery bundler osx rake ruby)

plugins=(zsh-autosuggestions)
# zsh-autosuggestions

plugins+=(zsh-completions)
# autoload -U compinit && compinit
autoload -Uz compinit && compinit -i
# zsh-completions

zmodload zsh/complist

setopt complete_in_word
# setopt MENU_COMPLETE # immediatelly insert first match

zstyle ':completion:*' completer _complete _prefix
zstyle ':completion:*' add-space true

# Smart case matching && match inside filenames
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# 'm:{a-z}={A-Z}'
# zstyle ':completion:*' matcher-list '' '' 'l:|=* r:|=*' 'l:|=* r:|=*'

zstyle ':completion:*:*:*:*:*' menu select

# Rehash when completing commands
zstyle ":completion:*:commands" rehash 1

# Process completion shows all processes with colors
zstyle ':completion:*:*:*:*:processes' menu yes select
zstyle ':completion:*:*:*:*:processes' force-list always
zstyle ':completion:*:*:*:*:processes' command 'ps -A -o pid,user,cmd'
zstyle ':completion:*:*:*:*:processes' list-colors "=(#b) #([0-9]#)*=0=${color[green]}"
zstyle ':completion:*:*:kill:*:processes' command 'ps --forest -e -o pid,user,tty,cmd'
# zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

# List all processes for killall
zstyle ':completion:*:processes-names' command "ps -eo cmd= | sed 's:\([^ ]*\).*:\1:;s:\(/[^ ]*/\)::;/^\[/d'"

# SSH usernames
if [[ -f ~/.ssh/config ]]; then
  _accounts=(`egrep "^User" ~/.ssh/config | sed s/User\ // | egrep -v '^\*$'`)
  zstyle ':completion:*:users' users $_accounts
fi

# Colors in completion
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Display message when no matches are found
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

# Ignore internal zsh functions
zstyle ':completion:*:functions' ignored-patterns '_*'

# Grouping for completion types (trial)
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:descriptions' format "%{${fg_bold[magenta]}%}= %d =%{$reset_color%}"
# zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*' group-name ""

# Speedup path completion
zstyle ':completion:*' accept-exact '*(N)'

# Cache expensive completions
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.cache/zsh

# User configuration

# modify your PATH variable
export PATH=~/.local/bin:$PATH

# or just hardcode your path like this
#export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin

export PATH="/usr/local/bin:/usr/bin:$PATH"

# export PATH=$PATH:"/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/go/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

## You may need to manually set your language environment
export LANG=en_GB.UTF-8
# export LC_COLLATE=en_GB.UTF-8
# export LC_CTYPE=en_GB.UTF-8
# export LC_MESSAGES=en_GB.UTF-8
# export LC_MONETARY=en_GB.UTF-8
# export LC_NUMERIC=en_GB.UTF-8
# export LC_TIME=en_GB.UTF-8
export LC_ALL=en_GB.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

autoload -U run-help
autoload run-help-git
autoload run-help-svn
autoload run-help-svk
alias help=run-help
# Configure Help command

# load zgen
source "${HOME}/.zgen/zgen.zsh"

# if the init scipt doesn't exist
if ! zgen saved; then

  # specify plugins here
  zgen oh-my-zsh

  # generate the init script from plugins above
  zgen save
fi

# AWS CLI Command Completion
source /usr/local/share/zsh/site-functions/_aws

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.

# openssl
export PATH="/usr/local/opt/openssl/bin:$PATH"

# sqlite
export PATH="/usr/local/opt/sqlite/bin:$PATH"

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Setting PATH for Python 2.7
  # The original version is saved in .bash_profile.pysave
  PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
  export PATH=/usr/local/bin:$PATH

  # Setting PATH for Python 3.6
  # The original version is saved in .bash_profile.pysave
  PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
  export PATH=/usr/local/bin:$PATH

  export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python2
  export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
  export WORKON_HOME=~/.environment
  source /usr/local/bin/virtualenvwrapper.sh

# To run gitignore.io from your command line you need an active internet connection and an environment function. You need to add a function to your environment that lets you access the gitignore.io API.
function gi() { curl -L -s https://www.gitignore.io/api/\$@ ;}

source <(kubectl completion zsh)
# Kubectl Autocomplete in zsh

# Activate the Fish-like syntax highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
