This example shows how a Pod accesses configuration data from the ConfigMap by passing in the data as environmental parameters of the container. Upon startup, the application would reference these parameters as system environment variables.

View the resource definition.

`cat consume-via-env.yaml`{{execute}}

Create the Pod.

`kubectl create -f consume-via-env.yaml`{{execute}}

Once the pod starts, its log can be viewed. The container in the Pod has written its environment variables to the console, which is now visible in the Pod's log.

`kubectl logs consume-via-cli`{{execute}}

You can also view the Pod's log from the Dashboard.
