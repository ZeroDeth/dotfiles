# ZSH

### Upgrade zsh with brew
```
brew install zsh
```

## Confirm brew’s zsh location
```
ls -la /usr/local/bin/zs*
brew list zsh
brew info zsh
```

### Use the brew zsh
```
sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh
which zsh
zsh --version
```

### Confirm You’re Running Brew zsh
```
dscl . -read /Users/$USER UserShell
echo $SHELL
```

# Inspiration
- [Use Homebrew zsh Instead of the OS X Default](https://rick.cogley.info/post/use-homebrew-zsh-instead-of-the-osx-default/)
