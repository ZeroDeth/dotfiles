#-------------------------------------------------------------------------------
# SSH Agent
#-------------------------------------------------------------------------------
# function __ssh_agent_is_started -d "check if ssh agent is already started"
#     if begin
#             test -f $SSH_ENV; and test -z "$SSH_AGENT_PID"
#         end
#         source $SSH_ENV >/dev/null
#     end

#     if test -z "$SSH_AGENT_PID"
#         return 1
#     end

#     ssh-add -l >/dev/null 2>&1
#     if test $status -eq 2
#         return 1
#     end
# end

# function __ssh_agent_start -d "start a new ssh agent"
#     ssh-agent -c | sed 's/^echo/#echo/' >$SSH_ENV
#     chmod 600 $SSH_ENV
#     source $SSH_ENV >/dev/null
#     ssh-add
# end

# if not test -d $HOME/.ssh
#     mkdir -p $HOME/.ssh
#     chmod 0700 $HOME/.ssh
# end

# if test -d $HOME/.gnupg
#     chmod 0700 $HOME/.gnupg
# end

# if test -z "$SSH_ENV"
#     set -xg SSH_ENV $HOME/.ssh/environment
# end

# if not __ssh_agent_is_started
#     __ssh_agent_start
# end

#-------------------------------------------------------------------------------
# Kitty Shell Integration
#-------------------------------------------------------------------------------
if set -q KITTY_INSTALLATION_DIR
    set --global KITTY_SHELL_INTEGRATION enabled
    source "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_conf.d/kitty-shell-integration.fish"
    set --prepend fish_complete_path "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_completions.d"
end

#-------------------------------------------------------------------------------
# Programs
#-------------------------------------------------------------------------------
# Vim: We should move this somewhere else but it works for now
# mkdir -p $HOME/.vim/{backup,swap,undo}

# Homebrew
if test -d /opt/homebrew
    set -gx HOMEBREW_PREFIX /opt/homebrew
    set -gx HOMEBREW_CELLAR /opt/homebrew/Cellar
    set -gx HOMEBREW_REPOSITORY /opt/homebrew
    set -q PATH; or set PATH ''
    set -gx PATH /opt/homebrew/bin /opt/homebrew/sbin $PATH
    set -q MANPATH; or set MANPATH ''
    set -gx MANPATH /opt/homebrew/share/man $MANPATH
    set -q INFOPATH; or set INFOPATH ''
    set -gx INFOPATH /opt/homebrew/share/info $INFOPATH
end

#-------------------------------------------------------------------------------
# Prompt
#-------------------------------------------------------------------------------
# Do not show any greeting
set --universal --erase fish_greeting
function fish_greeting
end
funcsave fish_greeting

# bobthefish theme
# set -g theme_color_scheme dracula

# My color scheme
# set -U fish_color_normal normal
# set -U fish_color_command F8F8F2
# set -U fish_color_quote F1FA8C
# set -U fish_color_redirection 8BE9FD
# set -U fish_color_end 50FA7B
# set -U fish_color_error FF5555
# set -U fish_color_param 5FFFFF
# set -U fish_color_comment 6272A4
# set -U fish_color_match --background=brblue
# set -U fish_color_selection white --bold --background=brblack
# set -U fish_color_search_match bryellow --background=brblack
# set -U fish_color_history_current --bold
# set -U fish_color_operator 00a6b2
# set -U fish_color_escape 00a6b2
# set -U fish_color_cwd green
# set -U fish_color_cwd_root red
# set -U fish_color_valid_path --underline
# set -U fish_color_autosuggestion BD93F9
# set -U fish_color_user brgreen
# set -U fish_color_host normal
# set -U fish_color_cancel -r
# set -U fish_pager_color_completion normal
# set -U fish_pager_color_description B3A06D yellow
# set -U fish_pager_color_prefix white --bold --underline
# set -U fish_pager_color_progress brwhite --background=cyan

# Override the nix prompt for the theme so that we show a more concise prompt
# function __bobthefish_prompt_nix -S -d 'Display current nix environment'
#     [ "$theme_display_nix" = no -o -z "$IN_NIX_SHELL" ]
#     and return

#     __bobthefish_start_segment $color_nix
#     echo -ns N ' '

#     set_color normal
# end

#-------------------------------------------------------------------------------
# Vars
#-------------------------------------------------------------------------------
# Modify our path to include our Go binaries
# contains $HOME/code/go/bin $fish_user_paths; or set -Ua fish_user_paths $HOME/code/go/bin
# contains $HOME/bin $fish_user_paths; or set -Ua fish_user_paths $HOME/bin

# Exported variables
# if isatty
#     set -x GPG_TTY (tty)
# end

#-------------------------------------------------------------------------------
# Functions
#-------------------------------------------------------------------------------
# Shortcut to setup a nix-shell with fish. This lets you do something like
# `fnix -p go` to get an environment with Go but use the fish shell along
# with it.
# alias fnix "nix-shell --run fish"

#-------------------------------------------------------------------------------
# IaC
#-------------------------------------------------------------------------------

# Setup the DOCKER_HOST for Colima
set -gx DOCKER_HOST "unix://$HOME/.colima/docker.sock"

# gcloud components
# set -gx PATH $PATH (brew --prefix)/share/google-cloud-sdk/bin

#-------------------------------------------------------------------------------
# Kubernetes
#-------------------------------------------------------------------------------
# Krew is the plugin manager for kubectl command-line tool.
# Show a tree of object hierarchies through ownerReferences.
set -q KREW_ROOT
set -gx PATH $PATH $KREW_ROOT/.krew/bin

#-------------------------------------------------------------------------------
# Warp - Rust-based terminal with AI
#-------------------------------------------------------------------------------
#
# For fish subshells, add to ~/.config/fish/config.fish.
if status is-interactive
    printf '\eP$f{"hook": "SourcedRcFileForWarp", "value": { "shell": "fish"}}\x9c'
end

#-------------------------------------------------------------------------------
# Aliases
#-------------------------------------------------------------------------------
#
#
. ~/.config/aliases/kubectl_aliases #TODO: move to shell/aliasses.nix
# [ -f "$HOME/.config/fish/kubectl_aliases.fish" ] && . "./kubectl_aliases.fish"

# When you miswrite command, you can just write fuck and this tool will guess command you wanted to write.
eval (thefuck --alias | tr '\n' ';')

# Source file for any general-case utils. example: additional aliases (k8s etc.)
# source "$HOME/.config/shell/shell_env"

#-------------------------------------------------------------------------------
# General
#-------------------------------------------------------------------------------

# set -gx LC_ALL en_GB.UTF-8
# set -gx LANG en_GB.UTF-8

# Preferred editor for local and remote sessions
# if test -n "$SSH_CONNECTION"
#     set -gx EDITOR vim
# else
#     set -gx EDITOR code
# end

## homebrew
fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/sbin

## pnpm
set -gx PNPM_HOME "$HOME/Library/pnpm"
set -gx PATH "$PNPM_HOME" $PATH

# set -gx VISUAL code
#set -gx JAVA_HOME (/usr/libexec/java_home -v 11)
#set -gx SSH_AUTH_SOCK ~/.1password/agent.sock
source ~/.config/op/plugins.sh

# set -U fish_user_paths /usr/local/bin $fish_user_paths
# set -U fish_user_paths /usr/local/MacGPG2/bin $fish_user_paths

# Configure Homebrew completions
# if test -d (brew --prefix)"/share/fish/completions"
#     set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/completions
# end

# if test -d (brew --prefix)"/share/fish/vendor_completions.d"
#     set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
# end

# fish-abbreviation-tips plugin

# Created by `pipx ensurepath`
# set PATH $PATH /Users/zerodeth/.local/bin

# Configure byobu //TODO: unkown command
# status --is-login; and status --is-interactive; and exec byobu-launcher status --is-login; and status --is-interactive; and exec byobu-launcher

# Configure ASDF
# Hook direnv into your shell.
# eval "$($ASDF_DIRENV_BIN hook fish)"

# Activate flox environment
eval "$(flox activate --dir ~)"
