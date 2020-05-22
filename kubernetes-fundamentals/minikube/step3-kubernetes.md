Up to this point a few Minikube CLI commands have been covered. However, the primary way to interact with Kubernetes from the command-line is instead through the CLI tool called KubeCtl.

Keep in mind the _minikube_ tool is for administering the hosting of the cluster where _kubectl_ tool is for administering Kubernetes itself, regardless of where Kubernetes is running. In the beginning it may take some time to keep the purpose of these commands separate.

Use a few kubectl commands to discover more about this Kubernetes instance established by Minikube.

Minikube stood up a specific version of Kubernetes.

`kubectl version`{{execute}}

As promised my it's name _mini_, it's a single node cluster.

`kubectl get nodes`{{execute}}

There are various ways to get details about this small cluster.

`kubectl get componentstatus`{{execute}}

`kubectl cluster-info`{{execute}}

`kubectl config view`{{execute}}

`kubectl config get-contexts`{{execute}}

More details are revealed with the describe command.

`kubectl describe node minikube`{{execute}}

Events can be listed.

`kubectl get events`{{execute}}