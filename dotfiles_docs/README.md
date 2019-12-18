## First Time Setup
```
mkdir $HOME/.dotfiles
git init --bare $HOME/.dotfiles
```
```
alias dotfiles="/usr/local/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
echo 'alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"' >> $HOME/.zshrc
source ~/.zshrc
```
```
dotfiles config --local status.showUntrackedFiles no
dotfiles remote add origin git@github.com:ZeroDeth/dotfiles.git
```
## Setting Up a New Machine

```
git clone --separate-git-dir=$HOME/.dotfiles https://github.com/ZeroDeth/dotfiles.git ~
```
```
git clone --separate-git-dir=$HOME/.dotfiles https://github.com/ZeroDeth/dotfiles.git tmpdotfiles
rsync --recursive --verbose --exclude '.git' tmpdotfiles/ $HOME/
rm -r tmpdotfiles
```
```
cd $HOME
dotfiles add .zshrc
dotfiles commit -m "Add .zshrc"
dotfiles push origin master
```
```
dotfiles status -s -uno
dotfiles checkout -b original_files -f
dotfiles commit -a  -m 'original files'
dotfiles checkout master
```

```
echo ".dotfiles" >> .gitignore
```
