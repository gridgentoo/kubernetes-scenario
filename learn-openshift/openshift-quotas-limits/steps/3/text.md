
Now, let's see what happens if we try to create one more pod. Prepare a new pod definition from the one used to create the first pod by replacing nginx with httpd:


<pre class="file" data-filename="httpd-pod.yml" data-target="replace">
apiVersion: v1
kind: Pod
metadata:
  name: httpd
  labels:
    role: web
spec:
  containers:
  - name: httpd
    image: httpd
    resources:
      requests:
        cpu: 400m
        memory: 128Mi
</pre>

If we try to create the second pod, we will see the following:
`oc create -f httpd-pod.yml`{{execute}}

```
Error from server (Forbidden): error when creating "httpd-pod.yml": pods "httpd" is forbidden: exceeded quota: my-quota, requested: pods=1, used: pods=1, limited: pods=1
```

Even though the amount of requested memory wouldn't violate the quota, pod creation was still denied because the quota limits the total number of pods to 1 for the current project.


Update the quota to allow 2 pods and 2 CPU cores:

`oc delete quota/my-quota`{{execute}}

`oc create quota my-quota \
--hard=cpu=500m,memory=256Mi,pods=2,resourcequotas=1`{{execute}}


```
spec:
  hard:
    cpu: 500m
    memory: 256Mi
    pods: "2"
    resourcequotas: "1"
```

Try creating the second pod again:
`oc create -f httpd-pod.yml`{{execute}}


It worked because the quota was set to allow 2 pods in the current project.

Let's see how many resources are used from the total allowed by the quota again:
`oc describe quota/my-quota`{{execute}}

As you can see, we have exhausted the entire quota and no new pods can be created.

Now that this exercise is over, it's time to prepare for the next one by cleaning up our lab:
`oc delete all --all`{{execute}}

`oc delete quota/my-quota`{{execute}}
