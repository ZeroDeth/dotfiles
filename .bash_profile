export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/usr/local/opt/ncurses/bin:$PATH"

## stern completion
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

## Vault command line completion
complete -C /usr/local/bin/vault vault

## direnv
eval "$(direnv hook bash)"

## VMware Fusion command-line utils
export PATH=$PATH:"/Applications/VMware Fusion.app/Contents/Library"

## #https://github.com/asdf-vm/asdf
#Mac Intel:
# . /usr/local/opt/asdf/libexec/asdf.sh
#Apple Silicon:
# . /opt/homebrew/opt/asdf/asdf.sh

# Find where asdf should be installed.
ASDF_DIR_INTEL="${/usr/local/opt/asdf/libexec}"
ASDF_DIR_M1="${/opt/homebrew/opt/asdf}"

# Load asdf, if found.
if [ -f $ASDF_DIR_INTEL/asdf.sh ]; then
    . $ASDF_DIR_M1/asdf.sh
fi

## fzf (fuzzy finder)
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
