In this step, you will create PersistentVolume. It is a storage resource which is used by pods to store persistent data in OpenShift.

# Task
To complete this step, define a PersistentVolume called `volume1` and define `hostPath` as 
_path: /data/volume1_ with `capacity` as _storage: 10Gi_.

Create hostpath persistent volume by running `oc create -f volume.yaml`{{execute HOST1}}. 

As a result, persistent volume is created pointing at host path `/data/volume1`.

