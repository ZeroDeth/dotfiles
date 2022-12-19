# Colima

## Issues
- `Error pinging Docker server: Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running?`
```sh
$ ls -la ~/.colima
$ export DOCKER_HOST="unix://$HOME/.colima/docker.sock"
```

## Troubleshooting
- [Why does Colima failed to find Docker daemon](https://stackoverflow.com/questions/72557053/why-does-colima-failed-to-find-docker-daemon/72560928#72560928)


