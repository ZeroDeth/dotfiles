# direnv

## Setup
For direnv to work properly it needs to be hooked into the shell. Each shell has its own extension mechanism.
Once the hook is configured, restart your shell for direnv to be activated.

```sh
brew install direnv

echo "$(direnv hook bash)" >> ~/.bash_profile
echo "$(direnv hook zsh)" >> ~/.zshrc

eval "$(direnv hook $SHELL)"

direnv allow <repository-directory>
```

## Quick demo
To follow along in your shell once direnv is installed.
```sh
# Create a new folder for demo purposes.
$ mkdir ~/my-project
$ cd ~/my-project

# Show that the FOO environment variable is not loaded.
$ echo ${FOO-nope}
nope

# Create a new .envrc. This file is bash code that is going to be loaded by
# direnv.
$ echo export FOO=foo > .envrc
.envrc is not allowed

# The security mechanism didn't allow to load the .envrc. Since we trust it,
# let's allow it's execution.
$ direnv allow .
direnv: reloading
direnv: loading .envrc
direnv export: +FOO

# Show that the FOO environment variable is loaded.
$ echo ${FOO-nope}
foo

# Exit the project
$ cd ..
direnv: unloading

# And now FOO is unset again
$ echo ${FOO-nope}
nope
```

## Resources
- [direnv Setup](https://direnv.net/docs/hook.html)
