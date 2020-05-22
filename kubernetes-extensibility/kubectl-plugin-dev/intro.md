# Creating A Kubectl Plugin #

![Kubernetes](/javajon/courses/kubernetes-extensibility/kubectl-plugin-dev/assets/kubernetes.png "Kubernetes")

This scenario takes you through the introductory steps for developing a kubectl plugin. You will create a plugin that will interact with a Kubernetes cluster. While the plugin is it's written in Go the steps will gently guide you, even if you are a bit new at writing code in Go.

In this scenario you will learn how to:

- Layout the source directory structure for a kubectl plugin
- Connect implementation logic to command
- Work with client references that can administer Kubernetes
- List and create Pods via a custom plugin
