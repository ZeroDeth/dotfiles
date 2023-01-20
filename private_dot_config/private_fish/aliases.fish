#!/usr/bin/env fish

# `.aliases` is used to provide custom variables.
#
# This file is used as a part of `.shell_env`

# === Aliases ===

## Make an alias for running git commands in our .dotfiles repository.
# alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

## Install A VIM/NeoVIM Version Support Python3 (https://clay-atlas.com/us/blog/2021/09/04/mac-os-en-install-vim-support-python3/)
# alias python="python3"

## Pretty print XML (use `jq` for json):
# alias xq="xmllint --format"

## Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

## Copy public key to clipboard:
# alias pubkey="cat ~/.ssh/id_krypton.pub | pbcopy | echo '=> Public key copied to pasteboard.'"
alias pubkey="cat ~/.ssh/id_ed25519.pub | pbcopy | echo '=> Public key copied to pasteboard.'"

alias topten="history | commands | sort -rn | head"

## A suffix alias allows you to open the file you type in the command line using the specified program based on the file extension.
# alias -s {yml,yaml}=vim

## A global alias enables you to create an alias that is expanded anywhere in the command line, not just at the beginning. This is very useful to replace common filenames or piped commands.
# alias -g G='| grep -i'

## Filesystem aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....="cd ../../.."
alias .....="cd ../../../.."

## Zsh keeps the history of directories you visited so you can quickly switch to any of them.
# d='dirs -v | head -10'

## Show only hidden files in Terminal
alias lh="ls -ld .?*"

## Show only directories and files in Terminal
# alias l="ls -lAh $colorflag"

# neovim
# if command -v nvim >/dev/null 2>&2; then
# 	alias vim='nvim'
# fi

## Templating tmux with tmuxinator
## example format: tmuxinator start project
# alias tx=tmuxinator
# alias mux=tmuxinator

# Trim new lines and copy to clipboard
alias trimcopy="tr -d '\n' | pbcopy"

## Recursively delete `.DS_Store` files
alias clStore="find . -name '*.DS_Store' -type f -ls -delete"
## remove broken symlinks
alias clSym="find -L . -name . -o -type d -prune -o -type l -exec rm {} +"
## Recursively delete `.terraform` files
alias clTerraform="find . -name '*.terraform' -type d -ls -delete"

## File size
alias fs="stat -f \"%z bytes\""

## ROT13-encode text. Works for decoding, too! ;)
alias rot13='tr a-zA-Z n-za-mN-ZA-M'

## One of @janmoesen’s ProTip™s
# for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
#     alias "$method"="lwp-request -m '$method'"
# done

## Kill all the tabs in Chrome to free up memory
## [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

alias chrome="/Applications/Google\\ \\Chrome.app/Contents/MacOS/Google\\ \\Chrome"
# alias canary="/Applications/Google\\ Chrome\\ Canary.app/Contents/MacOS/Google\\ Chrome\\ Canary"

# alias pcat='pygmentize -f terminal256 -O style=native -g'

## VMware Fusion command-line utils
# alias vmrun="/Applications/VMWare\ Fusion.app/Contents/Library/vmrun"

## Remote Shell Session Setup: iTerm2+tmux+mosh
# alias sshcvp='mosh --ssh='ssh -p 10140' r123s19 -- sh -c "tmux ls | grep -vq attached && tmux a || tmux new"'

## Configure Help command
# alias help=run-help

# autoload -U run-help
# autoload run-help-git
# autoload run-help-svn
# autoload run-help-svk

## Git aliases.
alias git=hub
# alias gs='git status'
# alias gc='git commit'
# alias gp='git pull --rebase'
# alias gcam='git commit -am'
# alias gl='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'
# alias gfp='git fetch --all && git pull --all'

# === Network ===

## IP addresses
alias myip="curl http://ipecho.net/plain; echo"
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

## Flush Directory Service cache
# alias flush="dscacheutil -flushcache"
alias flushsudo="sudo killall -HUP mDNSResponder; sleep 2"

## View HTTP traffic
alias sniff="sudo ngrep -d 'en0' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en0 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

## Using prettyping instead of ping
alias prettyping=ping

# === macOS ===

## macOS Finder
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

## fzf bat
alias fzb='fzf --preview "bat {} --color=always"'

# === Kitty ===

## Automatically sets up Shell integration on the remote host and copies the kitty terminfo database there
alias s="kitty +kitten ssh"

## Display images in the terminal
alias icat="kitty +kitten icat"

## Download kitty themes "git clone https://github.com/dexpota/kitty-themes ~/.config/kitty/themes"
alias kthemes="cd ~/.config/kitty/themes && fzf --preview 'head -n 40 {} && kitty @ --to unix:/tmp/kitty set-colors -a -c {}'; cd -"
