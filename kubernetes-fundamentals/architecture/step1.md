Kubernetes is a system made up of many individual components. Each component is responsible for one thing, and together they form a functional system.

The minimum set of components for a Kubernetes cluster is:

- `apiserver`: The API interface to create, edit, update, delete and view objects in the Kubernetes cluster.
- `controller-manager`: Runs control loops which monitor cluster state and perform the necessary actions to rectify any variations.
- `kube-scheduler`: Responsible for scheduling pods to nodes.
- `etcd`: A key-value storage where Kubernetes stores cluster state.
- `kubelet`: The agent running on each node and is responsible for managing pod lifecycles.
- `CoreDNS`: Provides DNS resolution to the cluster.

We can view these components by looking at the Pods running in the `kube-system` namespace:

`kubectl get pods --all-namespaces`{{execute}}

We can see that the `kube-apiserver`, `kube-controller-manager`, `kube-proxy`, `kube-scheduler`, and `etcd-master` are all running in Kubernetes. In addition, we see `coredns` (provides DNS resolution) and `weave-net` (the CNI plugin) running as well.

> The learning environment uses the `weave-net` container networking interface (CNI). There are many alternatives available,
> such as Calico, Cilium, and cloud provider specific implementation in Azure and Google.

The `kube-system` namespace is a special namespace reserved for Kubernetes system components. Normally, the master node does not allow execution of Pods with the exception of those responsible for the operation of the cluster (typically, those running in `kube-system`).
