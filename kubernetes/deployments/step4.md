Now that we have created our vue Deployment, let's see what we've got:

`kubectl get deployments`{{execute}}

`kubectl get rs`{{execute}}

`kubectl get pods`{{execute}}

Managing all of these objects by creating a Deployment is powerful because it lets us abstract away the Pods and ReplicaSets. We still need to configure them, but that gets easier with time.

Let's see what happened when we created our Deployment:

`kubectl describe deployment vue-deployment`{{execute}}

We can see that, in the events for the Deployment, a ReplicaSet was created. Let's see what the ReplicaSet with `kubectl describe rs`. Your ReplicaSet has a unique name, so you'll need to tab-complete.

When we look at the ReplicaSet events, we can see that it is creating Pods.

When we look at our Pods with `kubectl describe pod`, we'll see that the host pulled the image, and started the container.

Deployments can be updated on the command line with [`set`](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#set). Here's an example:

`kubectl set image deployment/vue-deployment vue=nginx:alpine --record`{{execute}}

Remember, Kubernetes lets you do whatever you want, even if it doesn't make sense. In this case, we updated the image `vue` to be `nginx`, which is allowed, although strange.

Let's see what happened now that we upated the image to something strange:

`kubectl describe deployment vue-deployment`{{execute}}

We can see the history, which includes scaling up and down ReplicaSets for Pods from our command. We can also view revision history:

`kubectl rollout history deployment vue-deployment`{{execute}}

We didn't specify any reason for our updates, so `CHANGE-CLAUSE` is empty. We can also update other configuration options, such as environment variables:

`kubectl set env deployment/vue-deployment username=admin`{{execute}}

How do we view those updated environment variables?

1. Let's get the name of the Pod
2. We need to exec `env` inside the Pod

You can also update `resources`, `selector`, `serviceaccount` and `subject`.

For now, let's simply delete our Deployment:

`kubectl delete -f ./resources/vue-simple.yaml`{{execute}}
