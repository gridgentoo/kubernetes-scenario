<pre class="file" data-filename="volume-claim.yaml" data-target="replace">
apiVersion: "v1"
kind: "PersistentVolumeClaim"
metadata:
  name: "claim1"
spec:
  accessModes:
    - "ReadWriteOnce"
  resources:
    requests:
      storage: "5Gi"
  volumeName: "volume1"
</pre>