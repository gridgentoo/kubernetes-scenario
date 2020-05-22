Deploy a simple application called [_echoserver_](https://console.cloud.google.com/gcr/images/google-containers/GLOBAL/echoserver?gcrImageListsize=30).

`kubectl create -f echoserver.yaml`{{execute}}

> A simpler way to do this is with the _run_ command, but this only creates a Pod. We want a Deployment with a ReplicaSet.

> `kubectl run hello --image=k8s.gcr.io/echoserver:1.9 --generator=run-pod/v1 --port=8080`

Take a look at the YAML files that defines this application.

`cat echoserver.yaml`{{execute}}

Notice this not only defines a `kind: Deployment`, but inside the deployment is a `ReplicaSet` of a `Pod` and that Pod consists of one `Container`. The Deployment is a preferred way of deploying applications instead of simply standing up just a Pod. You may see the advantage in the later step that scales the application.

It's only about 44 MB so it downloads and starts within a few moments. Ensure the _Available_ status changes from 0 to 1.

`kubectl get deployments,pods`{{execute}}

With this the application is running, however, it's not accessible. A service is needed for access.
