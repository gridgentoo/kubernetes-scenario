Up to now we have just been concentrating on Go and putting you applications in containers. This Katacoda instance also is a running Kubernetes cluster.

`kubectl get componentstatus`{{execute}}

## Install Registry

We need a registry where Kubernetes can pull the restafarian container so first install the registry on Kubernetes.

`helm install registry stable/docker-registry --namespace kube-system --set service.type=NodePort --set service.nodePort=31500`{{execute}}

Assign an environment variable to the common registry location.

`export REGISTRY=[[HOST_SUBDOMAIN]]-31500-[[KATACODA_HOST]].environments.katacoda.com`{{execute}}

In a moment, once the registry is serving, inspect the contents of the empty registry.

`curl $REGISTRY/v2/_catalog`{{execute}}

## Push to Registry

Push your app container image to the private registry running on you Kubernetes cluster.

`docker build -t $REGISTRY/restafarian-gin:0.0.1 .`{{execute}}

`docker push $REGISTRY/restafarian-gin:0.0.1`{{execute}}

## Run Application

Run the container you built in the previous step on your Kubernetes cluster. The container image comes from the registry.

`kubectl run restafarian --image=$REGISTRY/restafarian-gin:0.0.1 --generator=run-pod/v1 --port=8080`{{execute}}

Even if you have never used Kubernetes, this command should look fairly similar to the `docker run` commands. Now inspect the installation in progress.

`kubectl get pods`{{execute}}

You applications starts fairly quickly so the Pod status may be already running creating, or initializing. The app is ready for traffic once the Pod status reports `Running`.

However, from outside of Kubernetes at this terminal, it cannot be easily reached. Let's front the Pod with a Service. The service type will be NodePort which will expose the service on a high, random port.

`kubectl expose pod restafarian --type=NodePort`{{execute}}

Check the service list and notice the restafarian service is listed with a high port number.

`kubectl get services`{{execute}}.

The service is assigned a random Kubernetes NodePort (some value above 30000) and this next line will force the NodePort to 31111

`kubectl patch service restafarian --type='json' --patch='[{"op": "replace", "path": "/spec/ports/0/nodePort", "value":31111}]'`{{execute}}

and now the service lists the address for this exposed service's NodePort.

`kubectl get services`{{execute}}.

Obtain the public URL to the service.

`SERVICE_URL=https://[[HOST_SUBDOMAIN]]-31111-[[KATACODA_HOST]].environments.katacoda.com`{{execute}}

## Call REST API

The REST interface for restafarian service can be invoked like before.

`curl --data "topic=Cancer&idea=October+is+Breast+Cancer+Awareness+month" $SERVICE_URL/ideas/v1/ | jq .`{{execute}}

`curl --data "topic=Cancer&idea=Schedule+my+next+scan" $SERVICE_URL/ideas/v1/ | jq .`{{execute}}

`curl $SERVICE_URL/ideas/v1/ | jq .`{{execute}}

There is much to explore in Go, especially when you run applications as microservices packaged in containers. This scenario has started you on that path.
