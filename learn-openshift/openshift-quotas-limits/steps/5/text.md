The next step is to create a pod that requests a specific amount of computing resources and sets limits on their usage for itself. Prepare the following pod definition:

<pre class="file" data-filename="limits-example-pod.yml" data-target="replace">

apiVersion: v1
kind: Pod
metadata:
  name: limits-example
  labels:
    role: web
spec:
  containers:
  - name: httpd
    image: httpd
    resources:
      requests:
        cpu: 100m
        memory: 256Mi
      limits:
        cpu: 350m
        memory: 256Mi
</pre>


Next, create a pod from the definition:
`oc create -f limits-example-pod.yml`{{execute}}

```
Error from server (Forbidden): error when creating "limits-example-pod.yml": pods "limits-example" is forbidden: [minimum cpu usage per Pod is 200m, but request is 100m., maximum cpu usage per Container is 300m, but limit is 350m.]
```

As you might expect after looking at the pod's definition, the operation was rejected because the pod's request and limit ranges violate the policy defined earlier.

Note: Minimum boundaries are also enforced.

