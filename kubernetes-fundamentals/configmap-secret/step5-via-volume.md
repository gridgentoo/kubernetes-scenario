This example shows how a Pod accesses configuration data from the ConfigMap by reading from a file in a directory of the container. Upon startup, the application would reference these parameters by referencing the named files in the known directory.

View the resource definition.

`cat consume-via-vol.yaml`{{execute}}

Create the Pod.

`kubectl create -f consume-via-vol.yaml`{{execute}}

Using the [Dashboard](https://[[HOST_SUBDOMAIN]]-30000-[[KATACODA_HOST]].environments.katacoda.com/), inspect the Pod log and information page to see mapped data.
