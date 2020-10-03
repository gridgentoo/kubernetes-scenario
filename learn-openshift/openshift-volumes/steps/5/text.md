To complete this step, define a pod called `mypod` and with that pod define a container called `myfrontend`, which is based on the official `nginx:latest` docker image. We will send request to nginx at this port.

Also, define _volumeMounts_ with name `pvol` and use _mountPath_ as `/logs`. We will also use claim `claim1` created in the previous step.

OpenShift finds the claim with the given name and then uses the claim to find the volume to mount.

Create nginx pod by running `oc create -f pod.yaml`{{execute HOST1}}

You can see the name of the pods corresponding to the running containers for this application, by running:
``oc get pods``{{execute HOST1}}

You only have one instance of the application so only one pod will be listed.