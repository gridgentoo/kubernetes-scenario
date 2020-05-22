Minikube has a helpful command to list and inspect the Kubernetes services. Some of the services have been exposed as NodePorts. This means there are specific ports (or holes) that have been exposed outside of the cluster for incoming traffic. List the Minikube services.

`minikube service list`{{execute}}

Notice there are already some services running in the _kube-system_ namespace. These are present because the corresponding Addons are enabled. The _kubernetes-dashboard-katacoda_ is a service that is exposed as a NodePort for your access.

The URLs for these services can be listed.

`minikube service --namespace kube-system kubernetes-dashboard-katacoda --url`{{execute}}

You can see it's exposed as a NodePort with using a different command.

`kubectl get service kubernetes-dashboard-katacoda -n kube-system`{{execute}}

With this Katacoda virtualization, these URLs are not accessible from your browser, however they can be reached with Katacode URLs described in the next step.
