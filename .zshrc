# If you come from bash you might have to change your $PATH.
#export PATH=$HOME/bin:/usr/local/bin:$PATH

# display how long all tasks over 10 seconds take
export REPORTTIME=10

## Order-blind profiler - at the top
## Then restart Terminal and run env ZSH_PROF= zsh -ic zprof.
## https://blog.jonlu.ca/posts/speeding-up-zsh
zmodload zsh/zprof

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

## zsh tmux settings
## this always starts tmux
ZSH_TMUX_AUTOSTART='true'
ZSH_TMUX_AUTOSTART_ONCE='true'
ZSH_TMUX_FIXTERM='true'
ZSH_TMUX_AUTOQUIT='false'

# Your terminal appears to support fewer than 256 colors!
export TERM="xterm-256color"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

## ## ## ## Spaceship Settings ## ## ## ##
## https://github.com/denysdovhan/spaceship-prompt/wiki/Presets
## ORDER
SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  vi_mode       # Vi-mode indicator
  user          # Username section
  host          # Hostname section
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  # hg            # Mercurial section (hg_branch  + hg_status)
  package       # Package version
  node          # Node.js section
  ruby          # Ruby section
  # elixir        # Elixir section
  # xcode         # Xcode section
  #swift         # Swift section
  golang        # Go section
  docker        # Docker section
  # php           # PHP section
  # rust          # Rust section
  # haskell       # Haskell Stack section
  # julia         # Julia section
  aws           # Amazon Web Services section
  venv          # virtualenv section
  # conda         # conda virtualenv section
  pyenv         # Pyenv section
  # dotnet        # .NET section
  # ember         # Ember.js section
  kubecontext   # Kubectl context section
  terraform     # Terraform workspace section
  exec_time     # Execution time
  line_sep      # Line break
  battery       # Battery level and status
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

## USER
SPACESHIP_USER_PREFIX="" # remove `with` before username
SPACESHIP_USER_SUFFIX="" # remove space before host

## HOST
## Result will look like this:
##   username@:(hostname)
SPACESHIP_HOST_PREFIX="@:("
SPACESHIP_HOST_SUFFIX=") "

## DIR
SPACESHIP_DIR_PREFIX='' # disable directory prefix, cause it's not the first section
SPACESHIP_DIR_TRUNC='1' # show only last directory

## GIT
## Disable git symbol
SPACESHIP_GIT_SYMBOL="" # disable git prefix
SPACESHIP_GIT_BRANCH_PREFIX="" # disable branch prefix too
## Wrap git in `git:(...)`
SPACESHIP_GIT_PREFIX='git:('
SPACESHIP_GIT_SUFFIX=") "
SPACESHIP_GIT_BRANCH_SUFFIX="" # remove space after branch name
## Unwrap git status from `[...]`
SPACESHIP_GIT_STATUS_PREFIX=""
SPACESHIP_GIT_STATUS_SUFFIX=""

## NODE
SPACESHIP_NODE_PREFIX="node:("
SPACESHIP_NODE_SUFFIX=") "
SPACESHIP_NODE_SYMBOL=""

## RUBY
SPACESHIP_RUBY_PREFIX="ruby:("
SPACESHIP_RUBY_SUFFIX=") "
SPACESHIP_RUBY_SYMBOL=""

## XCODE
SPACESHIP_XCODE_PREFIX="xcode:("
SPACESHIP_XCODE_SUFFIX=") "
SPACESHIP_XCODE_SYMBOL=""

## SWIFT
SPACESHIP_SWIFT_PREFIX="swift:("
SPACESHIP_SWIFT_SUFFIX=") "
SPACESHIP_SWIFT_SYMBOL=""

## GOLANG
SPACESHIP_GOLANG_PREFIX="golang:("
SPACESHIP_GOLANG_SUFFIX=") "
SPACESHIP_GOLANG_SYMBOL=""

## DOCKER
SPACESHIP_DOCKER_PREFIX="docker:("
SPACESHIP_DOCKER_SUFFIX=") "
SPACESHIP_DOCKER_SYMBOL=""

## VENV
SPACESHIP_VENV_PREFIX="venv:("
SPACESHIP_VENV_SUFFIX=") "

## PYENV
SPACESHIP_PYENV_PREFIX="python:("
SPACESHIP_PYENV_SUFFIX=") "
SPACESHIP_PYENV_SYMBOL=""

## kubecontext
SPACESHIP_KUBECONTEXT_SHOW=""
SPACESHIP_KUBECONTEXT_PREFIX="k8s:("
SPACESHIP_KUBECONTEXT_SUFFIX=") "
SPACESHIP_KUBECONTEXT_SYMBOL=""

## Terraform
SPACESHIP_TERRAFORM_SHOW=""
SPACESHIP_TERRAFORM_PREFIX="tf:("
SPACESHIP_TERRAFORM_SUFFIX=") "
SPACESHIP_KUBECONTEXT_SYMBOL=""

##aws
SPACESHIP_AWS_SHOW=""
SPACESHIP_AWS_PREFIX="aws:("
SPACESHIP_AWS_SUFFIX=") "
SPACESHIP_AWS_SYMBOL=""
#### #### #### #### #### #### ####

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

## automatically upgrade Oh-My-Zsh without prompting you
DISABLE_UPDATE_PROMPT=true

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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
# fpath=(/usr/local/share/zsh-completions $fpath)
fpath=(~/.oh-my-zsh/custom/plugins/zsh-completions $fpath)
fpath=(~/.docker/completions $fpath)

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(
#   git
# )

## zsh-autosuggestions
# plugins=(zsh-autosuggestions)

## zsh-completions
# plugins+=(zsh-completions)

source $ZSH/oh-my-zsh.sh

## On slow systems, checking the cached .zcompdump file to see if it must be
## regenerated adds a noticable delay to zsh startup.  This little hack restricts
## it to once a day.  It should be pasted into your own completion file.
##
## The globbing is a little complicated here:
## - '#q' is an explicit glob qualifier that makes globbing work within zsh's [[ ]] construct.
## - 'N' makes the glob pattern evaluate to nothing when it doesn't match (rather than throw a globbing error)
## - '.' matches "regular files"
## - 'mh+24' matches files (or directories or whatever) that are older than 24 hours.
# autoload -Uz compinit && compinit -i
# autoload -U +X compinit && compinit
# if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
# 	compinit;
# else
# 	compinit -C;
# fi;

# Save the location of the current completion dump file.
# if [ -z "$ZSH_COMPDUMP" ]; then
#   ZSH_COMPDUMP="${ZDOTDIR:-${ZSH}}/.zcompdump-${SHORT_HOST}-${ZSH_VERSION}"
# fi

## Separate path for .zcompdump files
# compinit -d ~/.cache/zsh/.zcompdump-${SHORT_HOST}-${ZSH_VERSION}

#### #### Optimising completion system #### ####
## Simple excerpt based on Carlos’s solution.
# https://htr3n.github.io/2018/07/faster-zsh/
autoload -U +X bashcompinit && bashcompinit

# autoload -Uz compinit
if [ $(date +'%j') != $(/usr/bin/stat -f '%Sm' -t '%j' ${ZDOTDIR:-$HOME}/.zcompdump) ]; then
  compinit
else
  compinit -C
fi
#### #### Compiling completion dumped files #### ####
## Execute code in the background to not affect the current session
{
  # Compile zcompdump, if modified, to increase startup speed.
  zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
  if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]; then
    zcompile "$zcompdump"
  fi
} &!
#### #### #### #### #### #### ####

## colorful completion listings
zmodload -i zsh/complist
# zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# zmodload zsh/complist

## Allow completion from within a word/phrase
setopt COMPLETE_IN_WORD

zstyle ':completion:*' completer _complete _prefix
zstyle ':completion:*' add-space true

## When completing from the middle of a word, move the cursor to the end of the word
setopt ALWAYS_TO_END

## Smart case matching && match inside filenames
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# 'm:{a-z}={A-Z}'
# zstyle ':completion:*' matcher-list '' '' 'l:|=* r:|=*' 'l:|=* r:|=*'

zstyle ':completion:*:*:*:*:*' menu select

## Rehash when completing commands
zstyle ":completion:*:commands" rehash 1

### Process completion shows all processes with colors
zstyle ':completion:*:*:*:*:processes' menu yes select
zstyle ':completion:*:*:*:*:processes' force-list always
zstyle ':completion:*:*:*:*:processes' command 'ps -A -o pid,user,cmd'
zstyle ':completion:*:*:*:*:processes' list-colors "=(#b) #([0-9]#)*=0=${color[green]}"
zstyle ':completion:*:*:kill:*:processes' command 'ps --forest -e -o pid,user,tty,cmd'
## zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

## List all processes for killall
zstyle ':completion:*:processes-names' command "ps -eo cmd= | sed 's:\([^ ]*\).*:\1:;s:\(/[^ ]*/\)::;/^\[/d'"

## Display information about the kubectl current context and namespace in zsh prompt.
## https://github.com/superbrothers/zsh-kubectl-prompt
# autoload -U colors; colors
# source /usr/local/etc/zsh-kubectl-prompt/kubectl.zsh
# RPROMPT='%{$fg[blue]%}($ZSH_KUBECTL_PROMPT)%{$reset_color%}'
# zstyle ':zsh-kubectl-prompt:' separator '|'
# zstyle ':zsh-kubectl-prompt:' namespace false

## SSH usernames
if [[ -f ~/.ssh/config ]]; then
  _accounts=(`egrep "^User" ~/.ssh/config | sed s/User\ // | egrep -v '^\*$'`)
  zstyle ':completion:*:users' users $_accounts
fi

## Colors in completion
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

## Display message when no matches are found
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

## Ignore internal zsh functions
zstyle ':completion:*:functions' ignored-patterns '_*'

## Grouping for completion types (trial)
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:descriptions' format "%{${fg_bold[magenta]}%}= %d =%{$reset_color%}"
## zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*' group-name ""

## Speedup path completion
zstyle ':completion:*' accept-exact '*(N)'

## Cache expensive completions
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.cache/zsh

## User configuration

## gnu-tar
## brew install gnu-tar
export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"

##gnu-sed
## brew install gnu-sed
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

# export MANPATH="/usr/local/man:$MANPATH"

## You may need to manually set your language environment
export LANG=en_GB.UTF-8
export LC_ALL="${LANG}"
[[ -n "${LC_CTYPE}" ]] && unset LC_CTYPE


## Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# if [ -e $HOME/.bash_aliases ]; then
#     source $HOME/.bash_aliases
# fi

## iTerm2 Shell Integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

## AWS CLI Command Completion
source /usr/local/share/zsh/site-functions/_aws

## Azure CLI Command Completion
source /usr/local/etc/bash_completion.d/az

## AWS Serverless Application Model (AWS SAM CLI)
# export PATH="/usr/local/opt/sqlite/bin:$PATH"

## ## ## ## gCloud SDK ## ## ## ##
# https://cloud.google.com/sdk/docs/quickstart-macos
if [ -f '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc' ]; then . '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc' ]; then . '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'; fi
#### #### #### #### #### #### ####

## ## ## ## Kubernetes SDK ## ## ## ##

## add autocomplete permanently to your zsh shell
# if [ $commands[kubectl] ]; then source <(kubectl completion zsh); fi
# zstyle ':completion:*:*:kubectl:*' list-grouped false

## Kubernetes prompt info for bash and zsh
## https://github.com/jonmosco/kube-ps1
# source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
# PROMPT='$(kube_ps1)'$PROMPT

## Set the KUBECONFIG environment variable, Add paths similar to:
# export KUBECONFIG=$HOME/.kube/la-config:$HOME/.kube/config

## krew is now installed! To start using kubectl plugins, you need to add
# export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PATH="$HOME/.krew/bin:$PATH"
#### #### #### #### #### #### ####

# ## Setting Up Go
# ## https://www.zhubert.com/blog/2014/02/11/setting-up-go/
# export GOPATH=$HOME/go
# PATH=$PATH:$GOPATH/bin
#
# # goenv intercepts Go commands using shim executables injected into your PATH
# eval "$(goenv init -)"
#
# # Installs goenv autocompletion
# source ~/.goenv/completions/goenv.zsh
#
# ## pyenv
# if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
# # export PATH="$HOME/.pyenv/bin:$PATH"
# eval "$(pyenv init -)"
#
# ## Installs pyenv autocompletion
# source ~/.pyenv/completions/pyenv.zsh
#
# ## Using pyenv-virtualenv
# eval "$(pyenv virtualenv-init -)"

## Added by Krypton
export GPG_TTY=$(tty)


### ### ### Key Bindings ### ### ###
### This plugin provides a few widgets that you can use with bindkey:

## autosuggest-accept: Accepts the current suggestion.
bindkey '^ ' autosuggest-accept
## autosuggest-execute: Accepts and executes the current suggestion.
# bindkey '^M' autosuggest-execute
## autosuggest-clear: Clears the current suggestion.
## autosuggest-fetch: Fetches a suggestion (works even when suggestions are disabled).
## autosuggest-disable: Disables suggestions.
## autosuggest-enable: Re-enables suggestions.
## autosuggest-toggle: Toggles between enabled/disabled suggestions.
### ### ### ### ### ### ### ### ###


## User configuration
export PATH="/usr/local/sbin:/usr/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

## Custom envs:
source "$ZSH/oh-my-zsh.sh"
source "$HOME/.shell_env"

## Order-blind profiler - at the bottom
# zprof

# # Logic to call when needed
# load-function() {
#   # Some long process
# }
#
# # Helper alias if other scripts need to be loaded
# alias loadnvm='[ -s "$NVM_DIR/nvm.sh" ] && load-function'
