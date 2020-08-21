Upon first arrival the Dashboard will ask to create a first working space called a Namespace. Use the suggested name `anonymous` This namespace you name will coincide with a Kubernetes Namespace.

`kubectl get namespaces`{{execute}}

You will see also the namespace has been annotated and labeled so it will be recognized by Kubeflow and Istio.

`kubectl describe namespaces anonymous`{{execute}}

(More content will be arriving here in shortly so check back tomorrow...)
