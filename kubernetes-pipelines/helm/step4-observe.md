Helm deploys all the pods, replication controllers and services. The pod will be in a _pending_ state while the container image is downloaded and until a Persistent Volume is available. Once complete it will move into a _running_ state.

Use the _get_ command to find out what was deployed.

`watch kubectl get deployments,pods,services -n redis`{{execute}}

The Pod will be in a _pending_ state while the container image is downloaded and until a Persistent Volume is available. You will see a `my-redis-master-0` and `my-redis-slave-0` pod. Use this ```clear```{{execute interrupt}} to break out of the watch or press <kbd>Ctrl</kbd>+<kbd>C</kbd>.

Create a Persistent Volume for Redis.

`kubectl apply -f pv.yaml`{{execute}}

and ensure Redis has permissions to write to these mount points.

`mkdir /mnt/data1 /mnt/data2 /mnt/data3 --mode=777`{{execute}}

Now, notice Redis will change to _running_.

`watch kubectl get deployments,pods,services -n redis`{{execute}}

The Pods will move to the _ContainerCreating_ state. Once complete, the Pods will move to the _running_ state. It will be a few moments and all the Deployments will eventually move to the _available (1)_ state. Use this ```clear```{{execute interrupt}} to break out of the watch or press <kbd>Ctrl</kbd>+<kbd>C</kbd>.

You have successfully installed a [Redis cluster](https://[[HOST_SUBDOMAIN]]-31112-[[KATACODA_HOST]].environments.katacoda.com/) on Kubernetes.
