# GoLand
## [Command-line interface](https://www.jetbrains.com/help/go/working-with-the-ide-features-from-command-line.html)

For example, you can run **GoLand.app** with the following command:
```sh
$ open -na "GoLand.app"
```

You can create a shell script with this command in a directory from your `PATH` environment variable. For example, create the file **/usr/local/bin/goland** with the following contents:
```sh
#!/bin/sh

open -na "GoLand.app" --args "$argv" # fish
```

Make sure you have permissions to execute the script and since /usr/local/bin should be in the PATH environment variable by default, you should be able to run goland from anywhere in the shell.
```sh
$ sudo chmod -R 777 /usr/local/bin/goland
```
