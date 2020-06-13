Helm is a cluster administration tool that manages _charts_ on Kubernetes.

Helm relies on a packaging format called _charts_. Charts define a composition of related Kubernetes resources and values that make up a deployment solution. Charts are source code that can be packaged, versioned, and maintained in version control. Inside the chart are Kubernetes YAML files along with a templating language to allow contextual values to be injected into the YAMLs.

Helm also helps you manage the complexities of dependency management. Charts can include dependencies to other charts. Charts compliment your [infrastructure as code](https://en.wikipedia.org/wiki/Infrastructure_as_code) processes. Use Helm effectively with a mature container versioning pipeline.

The Helm CLI tool deploys charts to Kubernetes. A server side component can accept the chart and submit the YAML declarations to Kubernetes. The chart is a deployable unit that can be inspected, listed, updated and removed.

This scenario covers version 3.x of Helm. If you are using version 2.x, it's highly advisable to move to the recent version.

Interact with Helm start with a command-line tool (CLI). Helm can be installed from https://github.com/kubernetes/helm/releases

`curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash `{{execute}}

At this point Helm should be healthy.

`helm version --short`{{execute}}

Helm's default list of public repositories is initially empty. More on this later, but for now the Google chart repo can be added.

`helm repo add stable https://kubernetes-charts.storage.googleapis.com/`{{execute}}

The current local state of Helm is kept in your environment in the _home_ location.

`helm env`{{execute}}

The Helm command defaults to discovering the host already set in ~/.kube/config. There is a way to change or override the host, but that's beyond the scope of this scenario.

The next step gets right to it by installing a pre-made chart.
