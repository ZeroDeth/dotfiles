# Setting Up Go

## Requirements
- Install Go
- Make directories
- Set environment variables

### Install Go
```
brew install go
```
After it finishes, make sure you can find it:
```
which go
```
If things are setup correctly, your prompt will be showing the path to Go. Good, you’ve got Go.

### Make Directories
You can technically set this up however you want, but I like:
```
mkdir -p ~/Code/go/{pkg,src,bin}
```
This will make three directories inside Code/go in your home directory.

### Set Environment Variables
And here is the part that people find tricky. You first need to know what shell you are using. Try this:
```
echo $SHELL
```
If it says something with `bash`, the file you will be changing is `.bashrc`. There is a fun gotcha though with bash in that you will likely need to change `.bash_profile` first, make sure it has:
```
[[ -s ~/.bashrc ]] && source ~/.bashrc
```
If it says something with `zsh`, the file you will be changing is `.zshrc`. **You don’t need to make changes to another file.**

#### Changing `.zshrc` or `.bashrc`
Based on the above, you are now going to change whichever one from above. Specifically you are going to add at the bottom of the file:
```
export GOPATH=$HOME/Code/go
PATH=$PATH:$GOPATH/bin
```
This does two things, first it sets up your `GOPATH` which is absolutely essential for Go to work on your system. The second line adds all the binaries you will be making with `go install` available in your path so your shell can find them.

#### Check for Changes
Ok, you are in the new terminal window…type
```
echo $GOPATH
```
If this comes back empty, then the file you changed above is not getting called by whatever shell you are using. You have to fix that now.

Then check your PATH:
```
echo $PATH
```
If it includes `/Users/<NAME>/Code/go/bin` then you are ready to Go!

## Resources

- [Development Environment for Go Lang](https://tsuyoshiushio.medium.com/development-environment-for-go-lang-ede316d4512a)
