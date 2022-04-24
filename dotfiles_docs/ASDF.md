
# asdf-vm

## Install

```sh
# install required dependencies
brew install coreutils curl git gpg gawk

# install asdf
brew install asdf

# add it to your shell
echo -e "\n. $(brew --prefix asdf)/asdf.sh" >> ~/.bash_profile

# set up bash completions
echo -e "\n. $(brew --prefix asdf)/etc/bash_completion.d/asdf.bash" >> ~/.bash_profile
```

## How to Install Plugins and Versions
```sh
# install the package
asdf plugin add <name>
# asdf plugin add nodejs

# get a list of installed plugins
asdf plugin list

# update plugin(s)
asdf plugin update <name>
asdf plugin update --all

# remove plugin
asdf plugin remove <name>
# asdf plugin remove nodejs
```

```sh
# install version for package
asdf install <name> <version>
# asdf install nodejs 14.15.4

# list installed versions
asdf list <name>

# list all versions
asdf list all <name>
```

## How To Set the Current Plugin Version
```sh
asdf global <name> <version> [<version>...]
asdf shell <name> <version> [<version>...]
asdf local <name> <version> [<version>...]
# asdf global nodejs 14.15.4

```
## Legacy Support
```sh
# .asdfrc
legacy_version_file = yes
```

## Resources
- [nelsonmestevao/dotfiles](https://github.com/nelsonmestevao/dotfiles/tree/main/asdf)
- [Bash Loop Through a List of Strings](https://linuxhint.com/bash_loop_list_strings/)
- [Manage Node.js versions using asdf](https://blog.logrocket.com/manage-node-js-versions-using-asdf/)
- [How to Use Multiple Node Version With asdf](https://blog.natterstefan.me/how-to-use-multiple-node-version-with-asdf)


```sh
$ git clone https://github.com/asdf-vm/asdf.git "${ASDF_DIR}" && cd "${ASDF_DIR}" && git checkout "$(git describe --abbrev=0 --tags)"
$ for plugin in terraform direnv golang java nodejs python ruby yarn; do asdf plugin-add $plugin; done

# for plugin in direnv terraform golang java ruby python java nodejs haskell rust yarn;
# do
# 	asdf plugin-add $plugin;
# done

# for plugin in direnv terraform golang java ruby python java nodejs haskell rust yarn;
# do
# 	asdf plugin-remove $plugin;
# done

$ NODEJS_CHECK_SIGNATURES=no asdf install
```

```sh
plugins=(
  terraform
  golang
  ruby
  python
  java
  nodejs
  haskell
  rust
)

for plugin in "${plugins[@]}"; do
  execute "asdf plugin-add $plugin" "Adding $plugin plugin to asdf"
done
```

