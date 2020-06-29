Applications designed to embrace failure are the most healthy and resistant to interrupting users' experiences. Kubernetes embraces failure and so should your applications. One failure to expect is your containers _will_ fail. Kubernetes expects containers to crash and will restart Pods when that happens. When your application is load balancing and spreading fault tolerance across multiple Pods, whole groups of users should rarely be effected by container failures.

You can witness the Kubernetes resilience feature by purposefully killing your Pods. Scale the Pods back up.

`kubectl scale deployment hello --replicas=3`{{execute}}

Get the list of running pods.

`kubectl get pods --selector=run=hello`{{execute}}

Delete one of the Pods.

`kubectl delete --now pod $(kubectl get pods --selector=run=hello | sed '2!d' | cut -d' ' -f1)&`{{execute}}

Watch how Kubernetes recovers from the glitch.

`watch kubectl get pods --selector=run=hello`{{execute}}

Wait until the 3 pods are restored. Notice one Pod has a new ID in the name. Use this ```clear```{{execute interrupt}} to break out of the watch or press <kbd>Ctrl</kbd>+<kbd>C</kbd>.

When a Pod is no longer running, the Kubernetes controller recognizes the difference between the declared state and the reality of the cluster state. The controller will instruct the Scheduler on how to resolve the problem and the Schedular will search out the most healthy and optimum Kubelet among the worker nodes. The Kubelet will start the new Pod. Shortly thereafter the Controller will recognize the state of the cluster now matches the declared state and peace is restored.
