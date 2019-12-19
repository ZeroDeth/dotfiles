# Docker

## Troubleshooting
### [Autocompletion requires manual rm of a .zcompdump file](https://github.com/ohmyzsh/ohmyzsh/issues/7642#issuecomment-471164659)
[zsh docker plugin not working](https://stackoverflow.com/a/55341741/6611169)


remove .zcompdump files
```
rm ~/.zcompdump*
```
Then, restart the terminal
```
exec $SHELL
```
