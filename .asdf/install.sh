#!/usr/bin/env bash

#brew install asdf

##Looping Through a File that Contains Spaces – Bash for Loop
OLDIFS=$IFS

PLUGINS="
  direnv
  terraform
  golang
  ruby
  python
  java
  nodejs
  haskell
  rust
  yarn
"

VERSIONS='latest'

for i in $PLUGINS; do asdf plugin-add $i; done
for i in $PLUGINS; do asdf install $i $VERSIONS; done
# for i in $PLUGINS; do asdf shell $i $VERSIONS; done
# for i in $PLUGINS; do asdf global $i $VERSIONS; done


# VERSIONS="
#   direnv latest
#   terraform 0.11.14
#   golang
#   ruby
#   python
#   java
#   nodejs
#   haskell
#   rust
#   yarn
# "

# for i in $VERSIONS; do asdf install $i; done

# asdf plugin-list --all
# asdf plugin-update --all

# symlink ~/.dotfiles/asdf/asdfrc ~/.asdfrc
# symlink ~/.dotfiles/asdf/tool-versions ~/.tool-versions

IFS=$OLDIFS
