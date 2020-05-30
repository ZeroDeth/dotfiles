export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/usr/local/opt/ncurses/bin:$PATH"

## stern completion
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

## Vault command line completion
complete -C /usr/local/bin/vault vault

## direnv
eval "$(direnv hook bash)"
