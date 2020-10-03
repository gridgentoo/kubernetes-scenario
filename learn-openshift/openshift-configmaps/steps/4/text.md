

Now we are ready to inject it into a pod. Create a simple Pod definition that references the newly created ConfigMap:

<pre class="file" data-filename="example-pod-1.yml" data-target="replace">
apiVersion: v1
kind: Pod
metadata:
  name: example
spec:
  containers:
    - name: example
      image: cirros
      command: ["/bin/sh", "-c", "env"]
      envFrom:
        - configMapRef:
            name: example-config-map
</pre>

And create the pod using the preceding definition:
`oc create -f example-pod-1.yml`{{execute}}

Since the command is a simple Linux command, env, not a process or listening server of any kind, the pod exits right after it's completed, but you can still see its logs:
`oc logs po/example`{{execute}}

```
...
<output omitted>
...
VAR_1=Hello
VAR_2=World
```

As you can see, the two environment variables we defined in ConfigMap were successfully injected into the container. If we were to run an application inside our container, it could read them.

The same method can be used to supply these variables as command-line arguments to the container command. First, let's delete the old pod:
`oc delete po/example`{{execute}}
