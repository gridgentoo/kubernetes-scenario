You soon have a Kubeflow platform and available for experimentation. It's services have been installed.

`kubectl get services --namespace kubeflow`{{execute}}

The deployments are starting up.

`kubectl get deployment --namespace kubeflow`{{execute}}

Each deployment becomes available once the `AVAILABLE` status changes from `0` to `1`. It takes a few minutes for all the Pod associated with the Deployments and Services to download their containers and get them started.

`kubectl get pods --namespace kubeflow`{{execute}}

This whole Kubeflow framework will be available once these Pods all report `Running`. On a production cluster or a higher performing development or test cluster this Kubeflow stack would take less time to start and would normally be already running.

There are several new Custom Resource Definitions (CRDs) that have been installed on behalf of the Kubeflow Operator.

`kubectl get crds`{{execute}}

