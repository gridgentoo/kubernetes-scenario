In this step, you will create PersistentVolumeClaim. We will request storage by creating PersistentVolumeClaim.

# Task
To complete this step, define a PersistentVolumeClaim called `claim1` and define `volumeName` as _volume1_ with `requests` as _storage: "5Gi"_.

Create persistent volume claim which will bound to using volume `volume1` by running `oc create -f volume-claim.yaml`{{execute HOST1}}