Shown here is a YAML file that associates two containers in a Pod. The containers communicate with each other through shared path mounts. This allows the second container to act as a sidecar. Inspect how the Pod is created.

`cat sidecar-example.yaml`{{execute}}

Deploy the Pod.

`kubectl create -f sidecar-example.yaml`{{execute}}

Inspect the initialization progress.

`kubectl get pods`{{execute}}

Both containers in the Pod start quickly so the Pod status may be already running, creating, or initializing. One downside is the more containers you put in a Pod, the more time it will take to create, restart and scale. Be aware that containers start in parallel and the order of availability is not predictable. Nginx is running once the status the Pod status reports `Running`.

To interact with the Nginx application in the Pod we need a Service that can address the Pod. Let's expose a Service with the NodePort type.

`kubectl expose pod sidecar-pod --type=NodePort --port=80`{{execute}}

Now check the service list and notice the `sidecar-pod` Service is now listed with an URL.

`kubectl get services`{{execute}}.

The service is on a high, random Kubernetes NodePort (some value above 30000). This next line will force the NodePort to 31111

`kubectl patch service sidecar-pod --type='json' --patch='[{"op": "replace", "path": "/spec/ports/0/nodePort", "value":31111}]'`{{execute}}

Now the Service lists the exposed address with the correct port number.

`kubectl get services`{{execute}}.

Next, let's query the service.
