## Kubeflow CLI

The standard command-line tool for Kubeflow, `kfctl` is also available.

`kfctl version`{{execute}}

Whenever you add a CLI tool, often there will be a completion feature that will allow helpfully fill in the context for the command-line parameters using the tab key.

`source <(kfctl completion bash)`{{execute}}

## Kubeflow Dashboard

Navigate to the [Kubeflow dashboard](https://[[HOST_SUBDOMAIN]]-31380-[[KATACODA_HOST]].environments.katacoda.com/) and start exploring its features. The dashboard can also be accessed from the tab above the command line.

Upon first arrival the Dashboard will ask to create a first working space called a Namespace. Use the suggested name `anonymous` This namespace you name will coincide with a created Kubernetes Namespace.

`kubectl get namespaces`{{execute}}

You will see also the namespace has been annotated and labeled so it will be recognized by Kubeflow and Istio.

`kubectl describe namespaces anonymous`{{execute}}
