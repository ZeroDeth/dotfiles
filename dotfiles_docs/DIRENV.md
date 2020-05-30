# direnv
```sh
brew install direnv

echo "$(direnv hook bash)" >> ~/.bash_profile
echo "$(direnv hook zsh)" >> ~/.zshrc

eval "$(direnv hook $SHELL)"

direnv allow <repository-directory>
```
