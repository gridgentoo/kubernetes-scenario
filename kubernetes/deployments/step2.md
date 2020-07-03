Kubernetes Deployments can be created on the command line with [`kubectl run`](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#run). It enables you to configure both the Pods and ReplicaSets.

```yaml
kubectl run NAME --image=image
   --port=port]
  [--env="key=value"]
  [--replicas=replicas]
  [--dry-run=bool]
  [--overrides=inline-json]
  [--command]
  -- [COMMAND] [args...]
```

To create a simple Kubernetes deployment from the command-line:

`kubectl run vue --image=sylus/vue-hello-world --port 80`{{execute}}

Congrats, you have just created your first Deployment. The `run` command created a Deployment which automatically performed a few things for you:

* Created a ReplicaSet which created a pod
* The scheduler searched for a suitable node to run the pod and scheduled the pod to run on that Node
* Configured the cluster to restart / reschedule the pod when needed

Basically, it created all of the objects we defined, which include Pods and ReplicaSets. It scheduled the Pods on a node capable of accepting workloads.

To verify that the command created a Deployment:

`kubectl get deployments`{{execute}}

To see the Pods created by the Deployment:

`kubectl get pods`{{execute}}

To see the ReplicaSet created by the Deployment:

`kubectl get replicasets`{{execute}}

We can also get more information about our Deployment:

`kubectl describe deployment vue`{{execute}}

#### The magic of Deployments

If a pod that was created by a Deployment should ever crash, the Deployment will automatically restart it. To see this in action, kill the Pod directly:

`kubectl delete pod $(kubectl get pods --no-headers=true  | awk '{print $1;}')`{{execute}}

The pod should be deleted successfully. Now wait a moment or two and check the pod again:

`kubectl get pods`{{execute}}

Notice the the pod is running again. This is because the Deployment will restart a pod when it fails. What actually restarts those Pods?

Let's quickly clean up and delete our Deployment: `kubectl delete deployment vue`{{execute}}
