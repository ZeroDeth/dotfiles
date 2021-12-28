# display how long all tasks over 10 seconds take
export REPORTTIME=10

## Order-blind profiler - at the top
## Then restart Terminal and run env ZSH_PROF= zsh -ic zprof.
## https://blog.jonlu.ca/posts/speeding-up-zsh
zmodload zsh/zprof

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Your terminal appears to support fewer than 256 colors!
export TERM="xterm-256color"

# ====== Load alterantive Themes ======

## Set name of the theme to load --- if set to "random", it will
## load a random theme each time oh-my-zsh is loaded, in which case,
## to know which specific one was loaded, run: echo $RANDOM_THEME
## Setting this variable when ZSH_THEME=random will cause zsh to load
## See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="false"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="false"

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
# You can set one of the optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd.mm.yyyy"
HIST_IGNORE_SPACE="true"

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
#   gitfast
#   python
#   macos
#   brew
# )

## zsh-autosuggestions
# plugins=(zsh-autosuggestions)

## zsh-completions
# plugins+=(zsh-completions)

## homebrew
case $(uname) in
Darwin)
  if [[ $(uname -m) == 'arm64' ]]; then
    BREW_PREFIX='/opt/homebrew'
  elif [[ $(uname -m) == 'x86_64' ]]; then
    BREW_PREFIX='/usr/local'
  fi
  ;;
Linux) BREW_PREFIX='/home/linuxbrew/.linuxbrew' ;;
esac
eval $($BREW_PREFIX/bin/brew shellenv)

## iTerm2 Shell Integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

## #https://github.com/asdf-vm/asdf
. /usr/local/opt/asdf/libexec/asdf.sh

## User configuration
export PATH="/usr/local/sbin:/usr/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

## Custom envs:
source "$ZSH/oh-my-zsh.sh"
source "$HOME/.shell_env"

## Fun
## Hint; Managed by iTerm2
# neofetch --ascii "$(fortune -o |cowsay -W 50)" |lolcat

## Order-blind profiler - at the bottom
# zprof
