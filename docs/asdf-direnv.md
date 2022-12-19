# direnv-asdf on macOS

## Temporary environments for one-shot commands
### Enter a new shell having terraform and golang
```sh
$ asdf direnv shell terraform 1.3.6 golang 1.18.9
$ asdf current
```

### Just execute a cdktf command under some terraform version
```sh
$ asdf direnv shell terraform 1.3.6 -- terraform version
$ asdf current
```

## Inspired by:
- [asdf-direnv](https://github.com/asdf-community/asdf-direnv#global-asdf-direnv-integration)
- [How to manage multiple CLI tool versions with ease: direnv + asdf on macOS](https://blog.sighup.io/manage-tools-with-ease-direnv-asdf/)
