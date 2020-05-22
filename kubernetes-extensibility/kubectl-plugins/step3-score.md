<img align="right" src="./assets/score.png" width="300">

[kube-score](https://github.com/zegl/kube-score) is a tool that performs static code analysis of your Kubernetes object definitions. The tool outputs a list of recommendations of what you can improve to make your application more secure and resilient.

Get the plugin description

`kubectl krew info score`{{execute}}

Install the plugin.

`kubectl krew install score`{{execute}}

Locally there is a canonical nginx.yaml files copied directly from the Kubernetes documentation. Being it's a getting start YAML file for a basic NGINX deployment, it lacks all the other good practices needed for a hardened deployment. Score produces a helpful report on deficiencies and best practices.

`kubectl score nginx.yaml`{{execute}}

Other Score commands are available through help.

`kubectl score --help`{{execute}}

Hm... to bad, no `fix` command.

Try the analysis against resources in your cluster. First, deploy NGINX.

`kubectl create -f nginx.yaml`{{execute}}

Run the analysis.

`kubectl api-resources --verbs=list --namespaced -o name | xargs -n1 -I{} bash -c "kubectl get {} -n default -oyaml && echo ---" | kubectl score -`{{execute}}

This will take a few moments to see a similar report.

You can also run score against your Helm charts.

`helm template my-app | kubectl score -`
