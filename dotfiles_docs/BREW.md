# BREW

How do I reinstall all packages installed with Homebrew?
```sh
$ brew list | xargs brew reinstall
```

Update/Upgrade Brew packages?
```sh
$ brew missing; brew update --force; brew upgrade --ignore-pinned; brew upgrade --cask; brew cleanup; brew doctor
```

## Auto trigger history search in terminal using fzf (fuzzy finder) (https://unix.stackexchange.com/questions/534942/auto-trigger-history-search-in-terminal-using-fzf-fuzzy-finder)

```sh
$(brew --prefix)/opt/fzf/install
```
