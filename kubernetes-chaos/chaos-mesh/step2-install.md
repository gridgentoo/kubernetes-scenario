The project provides a script that will install the Chaos Mesh operator. However, to avoid reinventing a wheel we prefer the projects Helm chart as it offers commonly used package management with parameters, updates, and uninstall.

Create a namespace for the Chaos Mesh operator:

`kubectl create namespace chaos-mesh`{{execute}}

Add the chart repository for the Helm chart to be installed:

`helm repo add chaos-mesh https://charts.chaos-mesh.org`{{execute}}

Add the Custom Resource definitions that allow you to control chaos through declarations:

`curl -sSL https://mirrors.chaos-mesh.org/v0.9.0/crd.yaml | kubectl apply -f -`{{execute}}

Install the chart:

```bash
helm install chaos-mesh chaos-mesh/chaos-mesh \
  --version 0.2.0 \
  --namespace chaos-mesh \
  --set dashboard.create=true
```{{execute}}

Verify the Chaos Mesh operator has started its control plane:

`kubectl get deployments,pods,services --namespace chaos-mesh`{{execute}}

Optimally, everything should be running in about ~15 seconds.

The control plane components for the Chaos Mesh are:

- controller-manager - used to schedule and manage the lifecycle of chaos experiments. (This is a misnomer. This should be just named _controller_, not _controller-manager_, as its the controller based on the Operator Pattern. The controller-manager is the Kubernetes control plane component that manages all the controllers like this one).
- chaos-daemon - These are the Pods that control the chaos mesh. The Pods run on every cluster Node and wrapped in a DaemonSet. These DaemonSets have privileged system permissions to access each Node's network, cgroups, chroot, and other resources that are accessed based on your experiments.
- chaos-dashboard - An optional web interface providing you an alternate means to administer the engine and experiments. It's use is for convenience and any production use of the engine should be through the YAML resources for the Chaos Mesh CRDs.
