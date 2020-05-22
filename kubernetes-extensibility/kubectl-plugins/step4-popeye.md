<img align="right" src="./assets/popeye.png" width="300">

[Popeye](https://github.com/derailed/popeye) is a utility that scans live Kubernetes cluster and reports potential issues with deployed resources and configurations. Get the plugin description.

`kubectl krew info popeye`{{execute}}

Install the plugin.

`kubectl krew install popeye`{{execute}}

Other commands are available through help.

`kubectl popeye --help`{{execute}}

Try the analysis against default namespace where NGINX is deployed from the previous step.

`kubectl popeye -n default`{{execute}}

The report will overlap with some of the finding from Score. The more these tools find, the better.
