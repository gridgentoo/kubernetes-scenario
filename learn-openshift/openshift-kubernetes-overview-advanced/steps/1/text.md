Minikube is a tool that makes it easy to run Kubernetes locally. Minikube runs a single-node Kubernetes cluster inside a VM on your laptop for users looking to try out Kubernetes or develop with it day-to-day.

#### Kubernetes installation and configuration

In this chapter, you will install Minikube—a simple single-node Kubernetes cluster. While not suitable for any production-grade workload, it is a useful tool to learn the basics of cluster management quickly. Although it supports several drivers for VM providers, in this tutorial we will use the KVM2 driver since KVM virtualization is available even in a base Linux environment.
`minikube start`{{execute}}

**Note:** Please wait for the above command to complete, It will take around 3 minutes to complete.


Once download and setup stages are complete, check your Kubernetes cluster status with the minikube command:
`minikube status`{{execute}}

Check the Kubernetes cluster status with the kubectl command:
`kubectl cluster-info`{{execute}}

Kubernetes master is running at http://[[HOST_SUBDOMAIN]]-8443-[[KATACODA_HOST]].environments.katacoda.com/