Now that we've gotten a good taste of creating our own Deployments, its time to use the rolling update and rollback features.

First, let's all start off with a fully configured Nginx Deployment, located at `./resources/nginx.yaml`

For our ReplicaSet, we can configure a `strategy` that defines how to safely perform a rolling update.

```yaml
strategy:
  rollingUpdate:
    maxSurge: 1
    maxUnavailable: 1
  type: RollingUpdate
```

This strategy utilizes Rolling Updates. With rolling updates, Kubernetes will spin up a new Pod, and when it is ready, tear down an old Pod. The `maxSurge` refers to the total number of Pods that can be active at any given time. If `maxSurge` = 6 and `replicas` = 5, that means 1 new Pod (6 - 5) can be created at a time for the rolling update. `maxUnavailable` is the total number (or percentage) of Pods that can be unavailable at a time.

Here is what our Manifest looks like after integrating this:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
  labels:
    app: nginx
spec:
  replicas: 5
  selector:
    matchLabels:
      app: nginx
  strategy:
    rollingUpdate:
      maxSurge: 1
      maxUnavailable: 1
    type: RollingUpdate
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:1.8.1
        ports:
        - containerPort: 80
```

Now, let's apply this configuration change: `kubectl apply -f ./resources/nginx.yaml`{{execute}}

Now that the application is deployed, lets update the Manifest to use a different image: `nginx:alpine`. Now apply the changes.

`kubectl get pods --watch`{{execute}}

We can see that the Pods are being updated one at a time. If we look at the Deployment events, we can see this as well:

`kubectl describe deployment nginx-deployment`{{execute}}

We can see that the Deployment scaled up ReplicaSet for the new Pods, and then scaled down the old ReplicaSet. These actions were done one at a time, as specified by our RollingUpdate configuration.

We can now get our Deployment rollout history:

`kubectl rollout history deployment/nginx-deployment`{{execute}}

We can jump back a version:

`kubectl rollout undo deployment.v1.apps/nginx-deployment`{{execute}}
