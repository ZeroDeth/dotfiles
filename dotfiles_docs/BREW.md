# BREW

How do I reinstall all packages installed with Homebrew?
```sh
$ brew list | xargs brew reinstall
```

Update/Upgrade Brew packages?
```sh
➜ brew missing; brew update --force; brew upgrade --ignore-pinned; brew upgrade --cask; brew cleanup; brew doctor
```
