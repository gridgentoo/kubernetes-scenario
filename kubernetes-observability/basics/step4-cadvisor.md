Every Node in a Kubernetes cluster has a Kubelet process. Within each Kubelet process is a cAdvisor. The cAdvisor continuously gathers metrics about the state of the Kubernetes resources on each Node. This metrics information is vital to monitor to understand the state of the cluster. This wealth of information is available through the _Resource Metrics API_. Let's inspect the metrics.

Each node exposes statistics continuously updated by cAdvisor. For your cluster, get a list of the node names.

`kubectl get nodes`{{execute}}

For this small Kubernetes cluster on Katacoda the two names are named _master_ and _node01_.

`export NODE=master`{{execute}}

Open a proxy to the Kubernetes API port.

`kubectl proxy &`{{execute}}

Access the worker node statistics with this command to the Metrics API.

`curl localhost:8001/api/v1/nodes/$NODE/proxy/stats/`{{execute}}

`curl localhost:8001/api/v1/nodes/$(kubectl get nodes -o=jsonpath="{.items[0].metadata.name}")/proxy/metrics`{{execute}}

The Kubernetes API aggregates cluster-wide metrics at `/metrics`.

`curl localhost:8001/metrics`{{execute}}
