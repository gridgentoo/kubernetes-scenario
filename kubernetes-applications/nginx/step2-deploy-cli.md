The command-line interface (CLI) used to manage Kubernetes is appropriately named `kubectl`. We will use this tool to install the applications. Verify it's working.

`kubectl version`{{execute}}

In the first deployment we simply pass a few parameters that declare to Kubernetes our intent to make Nginx available. Use this command.

`kubectl run nginx-one --image=nginx --generator=run-pod/v1 --port=80`{{execute}}

if you are already familiar with the Docker or Podman CLI tools, this command will look familiar. Now inspect the installation in progress.

`kubectl get pods`{{execute}}

Nginx starts fairly quickly so the Pod status may be already running creating, or initializing. Nginx is ready for traffic once the Pod status reports `Running`.

However, from outside of Kubernetes at this terminal, it cannot be easily reached. Let's front the Pod with a Service. The service type will be NodePort which will expose the service on a high, random port.

`kubectl expose pod nginx-one --type=NodePort`{{execute}}

Now check the service list and notice the nginx-one service now is listed with a high port number.

`kubectl get services`{{execute}}.

The service is assigned a random Kubernetes NodePort (some value above 30000) and this next line will force the NodePort to 31111

`kubectl patch service nginx-one --type='json' --patch='[{"op": "replace", "path": "/spec/ports/0/nodePort", "value":31111}]'`{{execute}}

and now the service lists the address for this exposed service's NodePort.

`kubectl get services`{{execute}}.

The web interface for nginx-one can be seen from the tab "Nginx-One" above the command-line area or this link: https://[[HOST_SUBDOMAIN]]-31111-[[KATACODA_HOST]].environments.katacoda.com/

Next, let's explore a better way to deploy the same application.
