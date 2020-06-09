# Minikube
Minikube on Mac OS X with VMware Fusion for local development

## Requirements:

The simple way
This is a simple copy-paste guide to setup a Kubernetes test environment on Mac OS X with a package manager.

VMware Fusion
Installing VMware Fusion on Mac OS X is straight forward.

Here is something, that is relevant in context of this blog post. You should add the VMware CLI tools to your PATH, by adding a line like this to your `.zshrc` / `.bashrc`

### VMware Fusion command-line utils
```sh
export PATH=$PATH:"/Applications/VMware Fusion.app/Contents/Library"
```
If you follow this guide you should get to see this at some point:

```sh
$ vmrun list
Total running VMs: 1
/Users/me/.minikube/machines/minikube/minikube.vmx
```

kubectl via Homebrew
```sh
brew install kubectl
```

minikube via Homebrew
```sh
brew install minikube
```

Get started with minikube and VMware Fusion
```sh
$ minikube start --driver=vmware --loglevel 2
```

#### Example:
```sh
kubectl run hello-minikube --image=k8s.gcr.io/echoserver:1.4 --port=8080
kubectl expose deployment hello-minikube --type=NodePort
kubectl get pod
curl $(minikube service hello-minikube --url)
minikube service hello-minikube --url
```

Where is the socket?
```sh
vmrun list
Total running VMs: 1
/Users/me/.minikube/machines/minikube/minikube.vmx

vmrun listNetworkAdapters /Users/me/.minikube/machines/minikube/minikube.vmx
Total network adapters: 1
```

VMware guest is behind a NAT adapter. Any port mappings?
```sh
vmrun listPortForwardings vmnet8
Total port forwardings: 0
```

What processes run within the minikube VM?
```sh
$ minikube ssh
$ ps aux
```

Make use of minikube on macOS with **whalebrew** and **docker**

Install Docker CE with Homebrew.
```sh
brew install docker
```
whalebrew via Homebrew
```sh
brew install whalebrew
```

Use minikube with the local docker tools.

```sh
eval $(minikube docker-env)
docker ps
```

The images in the whalebrew organization are a set of images that are known to work well with Whalebrew. You can also install any other images on Docker Hub too, but they may not work well:
```sh
whalebrew install whalebrew/pwgen
whalebrew install whalebrew/wget
```

### Find packages
```sh
$ whalebrew search
whalebrew/ack
whalebrew/awscli
whalebrew/docker-cloud
whalebrew/ffmpeg
whalebrew/gnupg
...

$ whalebrew search wget
whalebrew/wget
```

Tool requires a local dotfile, you might need to change it.
With this setup you can aim create tools, which are simple to invoke and easily distributable.
```sh
file $(which pwgen)
/usr/local/bin/pwgen: a /usr/bin/env whalebrew script text executable, ASCII text
```

## Summary
It’s possible to get started with Kubernetes with a few commands on Mac OS X. VMware Fusion has useful command-line utilities. whalebrew and minikube can be combined to some extend.
