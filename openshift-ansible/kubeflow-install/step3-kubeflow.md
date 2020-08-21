You soon have a Kubeflow platform and available for experimentation. It's services have been installed.

`kubectl get services --namespace kubeflow`{{execute}}

The deployments are starting up.

`kubectl get deployment --namespace kubeflow`{{execute}}

Each deployment becomes available once the `AVAILABLE` status changes from `0` to `1`. It takes a few minutes for all the Pod associated with the Deployments and Services to download their containers and get them started.

`kubectl get pods --namespace kubeflow`{{execute}}

This whole Kubeflow framework will be available once these Pods all report `Running`. On a production cluster or a higher performing development or test cluster, this Kubeflow stack would take less time to start and would normally be already running.

There are several new Custom Resource Definitions (CRDs) that have been installed on behalf of the Kubeflow Operator.

`kubectl get crds`{{execute}}

The standard command-line tool for Kubeflow, `kfctl` is also available.

`kfctl version`{{execute}}

Once the deployments are all available navigate to the [Kubeflow dashboard](https://[[HOST_SUBDOMAIN]]-31380-[[KATACODA_HOST]].environments.katacoda.com/) and start exploring its features.

Next, let's connect to Kubeflow and explore with the Dashboard.
