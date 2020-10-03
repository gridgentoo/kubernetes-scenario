
Let's create a new pod definition so that you can use the variables as command-line arguments to echo the command:

<pre class="file" data-filename="example-pod-2.yml" data-target="replace">
apiVersion: v1
kind: Pod
metadata:
  name: example2
spec:
  containers:
    - name: example2
      image: cirros
      command: ["/bin/sh", "-c", "echo ${VAR_1} ${VAR_2}"]
      envFrom:
        - configMapRef:
            name: example-config-map
</pre>


Now, create a container from the updated definition:
`oc create -f example-pod-2.yml`{{execute}}

As we mentioned previously, the container will exit right after the command returns, but its logs will contain the output of the command, constructed of two variables from our ConfigMap:

`oc logs po/example2`{{execute}}

```
Hello World
```

Lastly, we will walk-through mounting ConfigMap as a configuration file into a pod. Again, let's delete the pod from the previous exercise:
`oc delete po/example2`{{execute}}
