
Now, add our service account to the pod's definition:

<pre class="file" data-filename="nginx-pod2.yml" data-target="replace">
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
serviceAccountName: myserviceaccount
</pre>


Let's try to create the pod again:
`oc create -f nginx-pod2.yml`{{execute}}


`oc get po`{{execute}}

```
NAME      READY     STATUS    RESTARTS   AGE
nginx     1/1       Running   0          15s
```

As you can see, now that we have added the appropriate SCC to the service account used by the pod, it started successfully.

**Note:** Instead of allowing your image to run as the root, an even better practice would be to optimize it to run as an arbitrary user by specifying an unprivileged USER, setting the appropriate permissions on files and directories, and configuring your application to listen on unprivileged ports.

Clean up after our exercise, but leave myserviceaccount with the anyuid SCC assigned in place – we will need it later on to run privileged pods:
`oc delete po/nginx`{{execute}}