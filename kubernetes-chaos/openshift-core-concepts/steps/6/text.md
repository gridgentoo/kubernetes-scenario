OpenShift pods are Kubernetes pods that represent a collection of containers, and each pod serves as a basic management unit. All containers in a pod share the same storage volumes and network. In order to get a list of pods in OpenShift, we can use the oc get pods command:
`oc get pods`{{execute}}

It is no different from the Kubernetes pod, which means behind the scenes it is a Docker container running. The only difference is that there are two containers now. One of them is a container (ruby-ex-1-build) that is used to build the final image with the source code applied. We can easily verify this by running the docker ps command:

`docker ps`{{execute}}

We can easily find the right running container by seeing the myproject/ruby-ex part of the image's ID. We can do similar actions in Kubernetes, like getting logs, editing or describing, and deleting pods.