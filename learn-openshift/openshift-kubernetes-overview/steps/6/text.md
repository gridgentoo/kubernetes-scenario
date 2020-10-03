The first essential command to run is kubectl get nodes. It gives us the number of Kubernetes nodes available:
`kubectl get nodes`{{execute}}

```
NAME      STATUS  ROLES   AGE   VERSION
minikube   Ready   <none> 2h    v1.9.0
```

In our case, the number of nodes will be equal to one, since we are using one VM for our practice. As we mentioned already, in order for different projects to coexist on the same or different nodes, namespaces are used. You may guess that the command we should use is kubectl get namespaces:
`kubectl get namespaces`{{execute}}

```
NAME          STATUS   AGE
default       Active   15h
kube-public   Active   15h
kube-system   Active   15h
```

It shows you that three default namespaces are available when you install Kubernetes with Minikube:

- default: The namespace where all resources without other namespaces are placed. It is used when the name of a namespace is not specified.

- kube-public: Used for resources that must be publicly available even to unauthenticated users.

- kube-system: As the name implies, it is used internally by Kubernetes itself for all system resources.

The last main missing component here is pods; as previously mentioned, pods represent a collection of containers and a pod is a basic management unit in Kubernetes. In our case, pods are Docker containers. We do not have any running pods yet, which can be easily verified by kubectl get pods:
`kubectl get pods`{{execute}}

It says No resources found, all because the pod is a Kubernetes resource, similar to other resources we are going to cover in this book.

**Note:**
Similarly to kubectl get pods, you can get the status of any other Kubernetes resource. We will discuss other Kubernetes resources later in this chapter.  
