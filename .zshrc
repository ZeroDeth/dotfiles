# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

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

## A suffix alias allows you to open the file you type in the command line using the specified program based on the file extension.
alias -s {yml,yaml}=vim

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

## Make an alias for running git commands in our .dotfiles repository.
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

## Filesystem aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....="cd ../../.."
alias .....="cd ../../../.."

# alias ll="ls -lah ${colorflag}"
# alias lld="ls -l | grep ^d"
## Colorize output, add file type indicator, and put sizes in human readable format
# alias la="ls -AF ${colorflag}"
## Same as above, but in long listing format
# alias l="ls -lFh ${colorflag}"

## macOS Finder
# alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
# alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

## Templating tmux with tmuxinator
## example format: tmuxinator start project
# alias tx=tmuxinator
alias mux=tmuxinator

## Show my ip address
alias myip="curl http://ipecho.net/plain; echo"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en0' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en0 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Trim new lines and copy to clipboard
alias trimcopy="tr -d '\n' | pbcopy"

# Recursively delete `.DS_Store` files
alias cleanup="find . -name '*.DS_Store' -type f -ls -delete"
# remove broken symlinks
alias clsym="find -L . -name . -o -type d -prune -o -type l -exec rm {} +"

# File size
alias fs="stat -f \"%z bytes\""

# ROT13-encode text. Works for decoding, too! ;)
alias rot13='tr a-zA-Z n-za-mN-ZA-M'

# One of @janmoesen’s ProTip™s
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
    alias "$method"="lwp-request -m '$method'"
done

# Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

alias chrome="/Applications/Google\\ \\Chrome.app/Contents/MacOS/Google\\ \\Chrome"
alias canary="/Applications/Google\\ Chrome\\ Canary.app/Contents/MacOS/Google\\ Chrome\\ Canary"

# alias pcat='pygmentize -f terminal256 -O style=native -g'

## Remote Shell Session Setup: iTerm2+tmux+mosh
alias sshcvp='mosh --ssh='ssh -p 10140' r123s19 -- sh -c "tmux ls | grep -vq attached && tmux a || tmux new"'

## Configure Help command
alias help=run-help

autoload -U run-help
autoload run-help-git
autoload run-help-svn
autoload run-help-svk

## Git aliases.
# alias gs='git status'
# alias gc='git commit'
# alias gp='git pull --rebase'
# alias gcam='git commit -am'
# alias gl='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'
# alias gfp='git fetch --all && git pull --all'

## iTerm2 Shell Integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

## AWS CLI Command Completion
source /usr/local/share/zsh/site-functions/_aws

## Azure CLI Command Completion
source /usr/local/etc/bash_completion.d/az

## AWS Serverless Application Model (AWS SAM CLI)
# export PATH="/usr/local/opt/sqlite/bin:$PATH"

# Antibody is a shell plugin manager made from the ground up thinking about performance.
# Documentation can be found at https://getantibody.github.io
# A plugin file is basically text file ~/.zsh_plugins.txt that has one plugin per line.
source <(antibody init)
antibody bundle < ~/.bundles.txt

## ## ## ## gCloud SDK ## ## ## ##
# https://cloud.google.com/sdk/docs/quickstart-macos
if [ -f '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc' ]; then . '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc' ]; then . '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'; fi
#### #### #### #### #### #### ####

## To run gitignore.io from your command line you need an active internet connection and an environment function. You need to add a function to your environment that lets you access the gitignore.io API.
function gi() { curl -L -s https://www.gitignore.io/api/\$@ ;}

## ## ## ## Kubernetes SDK ## ## ## ##
## minikube Autocomplete in zsh
source <(minikube completion zsh)

## Kubectl Autocomplete in zsh into the current shell
# source <(kubectl completion zsh) # only once
## add autocomplete permanently to your zsh shell
# if [ $commands[kubectl] ]; then source <(kubectl completion zsh); fi
# zstyle ':completion:*:*:kubectl:*' list-grouped false


## helm Autocomplete in zsh
source <(helm completion zsh)

## Istio Autocomplete in zsh
# source <(istioctl completion zsh)

## Multi pod and container log tailing for Kubernetes
## https://github.com/wercker/stern
source <(stern --completion=zsh)

alias kx='kubectx'
alias kn='kubens'

# Get current context
alias krc='kubectl config current-context'
# List all contexts
alias klc='kubectl config get-contexts -o name | sed "s/^/  /;\|^  $(krc)$|s/ /*/"'
# Change current context
alias kcc='kubectl config use-context "$(klc | fzf -e | sed "s/^..//")"'

# Get current namespace
alias krn='kubectl config get-contexts --no-headers "$(krc)" | awk "{print \$5}" | sed "s/^$/default/"'
# List all namespaces
alias kln='kubectl get -o name ns | sed "s|^.*/|  |;\|^  $(krn)$|s/ /*/"'
# Change current namespace
alias kcn='kubectl config set-context --current --namespace "$(kln | fzf -e | sed "s/^..//")"'
# kusotmoize
alias kak='kubectl apply -k .'
alias krmk='kubectl delete -k .'
alias kgk='kubectl get -k .'
alias kdk='kubectl describe -k .'
# alias kust='kustomize build . -o all.yaml'

# alias k='kubectl'
# alias sk='kubectl -n kube-system'
# alias ke='EDITOR=vim kubectl edit'
# alias klbaddr="kubectl get svc -ojsonpath='{.status.loadBalancer.ingress[0].hostname}'"
#
# alias kdebug='kubectl run -i -t debug --rm --image=caarlos0/debug --restart=Never'
# alias knrunning='kubectl get pods --field-selector=status.phase!=Running'
# alias kfails='kubectl get po -owide --all-namespaces | grep "0/" | tee /dev/tty | wc -l'
# alias kimg="kubectl get deployment --output=jsonpath='{.spec.template.spec.containers[*].image}'"
#
# alias kdall='kubectl describe --all-namespaces'
# alias kgpoall='kubectl get pods --all-namespaces'
# alias kgnoowide='kubectl get nodes -o=wide'
# alias kgnsowide='kubectl get namespaces -o=wide'
# alias krmall='kubectl delete --all'
# alias ksysrmall='kubectl --namespace=kube-system delete --all'
# alias krmpoall='kubectl delete pods --all'

## Kubernetes prompt info for bash and zsh
## https://github.com/jonmosco/kube-ps1
# source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
# PROMPT='$(kube_ps1)'$PROMPT

## Set the KUBECONFIG environment variable, Add paths similar to:
# export KUBECONFIG=$HOME/.kube/la-config:$HOME/.kube/config

## Easily install/uninstall Helm on RBAC Kubernetes
## https://medium.com/@pczarkowski/easily-install-uninstall-helm-on-rbac-kubernetes-8c3c0e22d0d7
helmins() {
 kubectl -n kube-system create serviceaccount tiller
 kubectl create clusterrolebinding tiller --clusterrole cluster-admin --serviceaccount=kube-system:tiller
 helm init --service-account=tiller
}
helmdel() {
 kubectl -n kube-system delete deployment tiller-deploy
 kubectl delete clusterrolebinding tiller
 kubectl -n kube-system delete serviceaccount tiller

}

## krew is now installed! To start using kubectl plugins, you need to add
# export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PATH="$HOME/.krew/bin:$PATH"
#### #### #### #### #### #### ####

## Code Completion for terraform-docs https://github.com/segmentio/terraform-docs
source <(terraform-docs completion zsh)

## create a personal access token:
## https://github.com/settings/tokens/new?scopes=gist,public_repo&description=Homebrew
export HOMEBREW_GITHUB_API_TOKEN=""

## Tell homebrew to not autoupdate every single time I run it (just once a week).
export HOMEBREW_AUTO_UPDATE_SECS=604800

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

#£ Added by Krypton
export GPG_TTY=$(tty)

## Delete a given line number in the known_hosts file.
knownrm() {
  re='^[0-9]+$'
  if ! [[ $1 =~ $re ]] ; then
    echo "error: line number missing" >&2;
  else
    sed -i '' "$1d" ~/.ssh/known_hosts
  fi
}

## Display the Top 10 most frequently used shell commands that I type, which is as follows:
function commands() {
  awk '{a[$2]++}END{for(i in a){print a[i] " " i}}'
}

alias topten="history | commands | sort -rn | head"

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

## Order-blind profiler - at the bottom
# zprof

# # Logic to call when needed
# load-function() {
#   # Some long process
# }
#
# # Helper alias if other scripts need to be loaded
# alias loadnvm='[ -s "$NVM_DIR/nvm.sh" ] && load-function'
