Pods are the base primitive that Kubernetes uses to manage containerized applications. We can easily create a Pod on the CLI:

`kubectl run nginx --image=nginx --port=80 --restart=Never`{{execute}}

We start with `kubectl run`. This instructs Kubernetes to create a Pod resource. The first parameter, `nginx`, provides the name of the Pod. After that, `--image=nginx` instructs Kubernetes to create a Pod that runs a container based off the `nginx` image. `--port=80` instructs Kubernetes to have the underlying container listen on port 80. `--restart=Never` tells Kubernetes to not restart the Pod.

## List running Pods

Now that we have a Pod, we can see it in action by using the *get* verb:

`kubectl get pods`{{execute}}

> *NOTE*: **po** is short for *pods*, so this works too: `kubectl get po`

We can see that we have a single Pod with a status of running:

```
NAME      READY     STATUS    RESTARTS   AGE
nginx     1/1       Running   0          10s
```

> *NOTE*: `kubectl get` is a common Kubernetes command that we will use throughout the training.

## Inspect running Pods

Often we will need to inspect running Kubernetes objects. To do this we use the *describe* verb.

`kubectl describe` gives us more information about any Kubernetes object.

To show detailed information about our running Pod, use:

`kubectl describe pods nginx`{{execute}}

We can chain this command to get more fine-grained details:

`kubectl describe pod nginx | grep IP | awk '{print $2}'`{{execute}}

That will get the IP address of our nginx Pod. In general, you won't actually create Pods using the CLI. However, understanding how to get information from them is extremely important.

We can see that our Pod has a unique IP address, which we'll use in a second. Right now, our pod has been scheduled on `node01`:

`kubectl describe pod nginx | grep Node | awk '{print $2}'`{{execute}}

Let's SSH to this node:

`ssh node01`{{execute}}

We can actually see the container running Docker:

`docker container ls | grep k8s_nginx`{{execute}}

Let's inspect this container using `docker container inspect`{{execute}}, followed by the name of the container. Don't worry, you can just tab complete the name.

We can see that our container is running nicely. However, we can also see it doesn't have an IP address. Kubernetes is abstracting this away, even from Docker.

We already got the IP address of the Pod before, so let's download the files from NGINX using `curl`.

You'll need to execute `curl <container IP>`, with your specific IP address for the container.

Now that we've accessed the container, let's look at the logs with Docker, using `docker container logs k8s_nginx`, make sure to tab complete that.

Now `exit` the SSH session, we'll use kubectl to read the logs as well:

`kubectl logs nginx`{{execute}}

The messages are the same, Kubernetes is just abstracting away Docker.

## Delete a Pod

For now, let's clean up the environment by deleting our Pod.

`kubectl delete` is the command we’ll use to delete resources.

`kubectl delete pod nginx`{{execute}}

**WARNING**: Be careful, once our Pod is deleted, it is gone forever.
