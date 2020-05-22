You control the KUDO development using the KUDO plugin that extends your kubectl tool. To add the plugin on the Linux based Katacoda instance, you will use the Krew plugin, which is a plugin manager for kubectl.

## Install Krew

<img align="right" src="./assets/krew.png" width="300">

Krew is a tool that helps you discover, install, and manage plugins registered with your kubectl tool. It is similar to tools like apt, dnf or brew.

There are a [few ways to install Krew](https://krew.sigs.k8s.io/docs/user-guide/setup/install/) based on your environment, but for this Katacoda scenario we choose the recommended commands for Bash. Install Krew as a plugin for kubectl.

```
pushd "$(mktemp -d)" &&
curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/krew.{tar.gz,yaml}" &&
tar zxvf krew.tar.gz &&
KREW=./krew-"$(uname | tr '[:upper:]' '[:lower:]')_amd64" &&
"$KREW" install --manifest=krew.yaml --archive=krew.tar.gz &&
"$KREW" update &&
popd
```{{execute}}

This will take a moment to complete. You will want to add this to your system path.

`export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"`{{execute}}

Krew is now available so verify its version.

`kubectl krew version`{{execute}}

The installation was a bit lengthy, but now that you have Krew, all the other plugin installations are clean and neat. First and foremost, Krew is a collector of close to 87 plugins.

## Install KUDO

Install the KUDO plugin using Krew.

`kubectl krew install kudo`{{execute}}

Verify the plugin is available.

`kubectl kudo version`{{execute}}
