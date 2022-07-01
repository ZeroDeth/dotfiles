# github.com/zerodeth/dotfiles

dotfiles, managed with [`chezmoi`](https://github.com/twpayne/chezmoi).

## Install

This'll install Homebrew and chezmoi. After installation `chezmoi` will be initialized.

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/zerodeth/dotfiles/main/install.sh)"
```

## Manual install

Prerequisite: Homebrew & chezmoi

```shell
# Setup
chezmoi init https://github.com/zerodeth/dotfiles.git

# Configure ~/.config/chezmoi/chezmoi.toml
chezmoi init
```
