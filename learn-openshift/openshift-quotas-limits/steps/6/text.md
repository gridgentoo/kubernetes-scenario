Let's edit the pod's definition to comply with the defined LimitRange:

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
        cpu: 200m
        memory: 256Mi
      limits:
        cpu: 250m
        memory: 256Mi
</pre>


Try to create it again and observe that it works:
`oc create -f limits-example-pod.yml`{{execute}}

`oc get pod`{{execute}}

```
NAME          READY   STATUS    RESTARTS   AGE
limits-example 1/1    Running    0         4s
```

Let's clean up:

`oc delete po/limits-example`{{execute}}

`oc delete limits/my-limits`{{execute}}

**Note:** LimitRanges are considered a separate kind of resource as well, like templates, ConfigMaps, and ResourceQuotas, so they must be deleted by issuing a separate command.