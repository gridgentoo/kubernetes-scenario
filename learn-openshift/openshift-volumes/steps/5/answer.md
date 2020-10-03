<pre class="file" data-filename="pod.yaml" data-target="replace">
apiVersion: "v1"
kind: "Pod"
metadata:
  name: "mypod"
spec:
  containers:
    -
      name: "myfrontend"
      image: "nginx:latest"
      volumeMounts:
        -
          mountPath: "/logs"
          name: "pvol"
  volumes:
    -
      name: "pvol"
      persistentVolumeClaim:
        claimName: "claim1"
</pre>