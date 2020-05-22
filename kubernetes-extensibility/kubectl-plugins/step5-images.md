<img align="right" src="./assets/containers-unsplash.png" width="250">

## Images and Outdated Plugins

Developers, architects and administrators can all get insights into what's running on the cluster just by looking at the containers.

Plugins:
- **Image**: List container images used in the cluster.
- **Outdated**: List outdated container images running in a cluster

Install the plugins.

`kubectl krew install images`{{execute}}

`kubectl krew install outdated`{{execute}}

List all the containers across all namespaces in your cluster.

`kubectl images -A`{{execute}}

List all the containers across all namespaces in your cluster showing which are current or could be updated.

`kubectl outdated`{{execute}}

Like all plugin, these plugins have further command-line options. See `--help` for options.
