# ZSH

## Upgrade zsh with brew
```sh
brew install zsh
```

### Confirm brew’s zsh location
```sh
ls -la /usr/local/bin/zs*
brew list zsh
brew info zsh
```

### Use the brew zsh
```sh
sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh
which zsh
zsh --version
```

### Confirm You’re Running Brew zsh
```sh
dscl . -read /Users/$USER UserShell
echo $SHELL
```

## Manually update oh-my-zsh
```sh
upgrade_oh_my_zsh
```

## Resources
- [Use Homebrew zsh Instead of the OS X Default](https://rick.cogley.info/post/use-homebrew-zsh-instead-of-the-osx-default/)
