There are many workflows around Kubernetes that need access to one more container registries. While public registries are commonly referenced there is privacy concerns and no need to shuttle private images over public networks. Instead, private registries keep all this pushing and pulling in a local registry.

There are many options for standing up a container registry. We prefer a pure Kubernetes solution and install a registry through the [stable Helm chart](https://github.com/helm/charts/tree/master/stable/docker-registry#docker-registry-helm-chart).

Add the Harbor chart report to Helm.

`helm repo add harbor https://helm.goharbor.io`{{execute}}

Create a namespace for the installation target.

`kubectl create namespace harbor`{{execute}}

Install Harbor from the Helm chart.

`helm install harbor harbor/harbor --namespace harbor \
--set persistence.enabled=false \
--set expose.tls.enabled=false \
--set expose.type=nodePort \
--set expose.nodePort.ports.http.nodePort=31500`{{execute}}

A few of the persistence and security features have been disabled for this Katacoda example. 

This chart bootstraps a Harbor instance consisting of several deployed components. To get a complete status of the deployment availability run this inspection.

`watch kubectl get deployments --namespace harbor`{{execute}}

This can take up to about 4 minutes. Once complete, the Deployments will move to the _AVAILABLE_ state (0 to 1). The Harbor server containers take about 4-5 minutes to start. All the Deployments will eventually move to the _Available (1)_ state. Use this ```clear```{{execute interrupt}} to break out of the watch or press <kbd>Ctrl</kbd>+<kbd>C</kbd>.

The registry is now available as a service. It can be listed.

`kubectl get service --namespace harbor`{{execute}}

The Docker tag, push and pull commands must all have the same host name for the image. Docker also requires SSL access, so it's necessary to consistently refer to the registry from the command-line and from within the cluster. In this scenario case we can simply use 127.0.0.0. Use port-forward to expose the registry.

`kubectl port-forward --namespace harbor \
$(kubectl get po -n harbor | grep harbor-registry | \
awk '{print $1;}') 5000:5000 &`{{execute}}

Assign an environment variable to the common registry location.

`export REGISTRY=127.0.0.1:31500`{{execute}}

Once the registry is serving, inspect the contents of the empty registry.

`curl $REGISTRY/v2/_catalog`{{execute}}
