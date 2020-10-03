<pre class="file" data-filename="volume.yaml" data-target="replace">

apiVersion: v1
kind: PersistentVolume
metadata:
    name: volume1
spec:
    accessModes:
        - ReadWriteOnce
        - ReadWriteMany
        - ReadOnlyMany
    capacity:
        storage: 10Gi
    hostPath:
        path: /data/volume1
    persistentVolumeReclaimPolicy: Recycle
	
</pre>