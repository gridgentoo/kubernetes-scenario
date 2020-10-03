
ResourceQuota can be used to control the number of API resources that can be created, or the amount of CPU, memory, and storage consumed by pods in the same project the quotas were defined in. Essentially, they determine the capacity of a project. ResourceQuotas allows you to control the following types of resources:

```
Pods            Services    Secrets
ResourceQuotas  ConfigMaps  ImageStreams
PVCs            requests.storage
cpu memory      ephemeral  limits.cpu
ReplicationControllers limits.memory
```

**Note:** If CPU/memory or limits.cpu/limits.memory are managed by quotas, then all pods in the same project must specify requests/limits for the respective computing resources.

In the context of quotas, all pods belong to the following scopes, to which quotas can be applied and that scope a certain set of resources:

Scope | Description
--- | ---
`BestEffort` | *Applies to all pods running with BestEffort quality of service, which means pods that have equal requests and limits for CPU, memory, or both. .*
`NotBestEffort` | *Applies to all pods running without BestEffort quality of service.*
`Terminating` | *Applies to all pods deployed by jobs with spec.activeDeadlineSeconds >= 0, which means, for example, build pods that get deployed during S2I builds.*
`NotTerminating` | *Applies to all pods deployed by jobs with spec.activeDeadlineSeconds is nil, which means the usual pods with applications.*


Then we will be able to create our first quota:


`oc create quota my-quota \
--hard=cpu=500m,memory=256Mi,pods=1,resourcequotas=1`{{execute}}


As you can see, the quota was successfully created:
`oc describe quota/my-quota`{{execute}}

```
Name:            my-quota
Namespace:       advanced
Resource         Used    Hard
--------         ----    ----
cpu              0       500m
memory           0       256Mi
pods             0       1
resourcequotas   1       1
```

Note: The number of quotas itself per project can be controlled by ResourceQuota. Even if you set a limit for quotas to 0, you will still be able to create your first quota, provided there is no other already existing quota that limits this number.

By creating this quota, we have set the limits of 500 CPU millicores (half-core), 256Mi requested RAM, 1 pod, and 1 ResourceQuota on the current project. Let's see if the quota is in effect.

First, create a simple pod definition:

<pre class="file" data-filename="nginx-pod.yml" data-target="replace">
apiVersion: v1
kind: Pod
metadata:
  name: nginx
  labels:
    role: web
spec:
  containers:
  - name: nginx
    image: nginx
</pre>


Let's try to create a pod from it:
`oc create -f nginx-pod.yml`{{execute}}

```
Error from server (Forbidden): error when creating "nginx-pod.yml": pods "nginx" is forbidden: failed quota: my-quota: must specify cpu,memory
```

As you can see, our definition didn't pass the check by the quota because it explicitly limits the requested amount of CPU and RAM, but we didn't specify them. Let's modify nginx-pod.yml and add resources section:


<pre class="file" data-filename="nginx-pod.yml" data-target="replace">

apiVersion: v1
kind: Pod
metadata:
  name: nginx
  labels:
    role: web
spec:
  containers:
  - name: nginx
    image: nginx
    resources:
      requests:
        cpu: 100m
        memory: 128Mi
</pre>


Upon creation, the pod will request 1 CPU core and 128 MiB of RAM, which is well within the limits set by the quota. Let's try it again:
`oc create -f nginx-pod.yml`{{execute}}

The pod was created successfully, as expected. At this point, we can take a look at how much of our quota was consumed:
`oc describe quota/my-quota`{{execute}}


```
Name:            my-quota
Namespace:       advanced
Resource         Used    Hard
--------         ----    ----
cpu              100m    500m
memory           128Mi   256Mi
pods             1       1
resourcequotas   1       1
```
