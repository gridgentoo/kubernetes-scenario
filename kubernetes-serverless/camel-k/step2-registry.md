## Establish Private Registry on Kubernetes ##

`helm install registry stable/docker-registry --set service.type=NodePort`{{execute}}

This start a private container registry that Camel K will use. To verify it is accessible find the IP and PORT of the service:

`export NODE_PORT=$(kubectl get --namespace default -o jsonpath="{.spec.ports[0].nodePort}" services registry-docker-registry)`{{execute}}

`export NODE_IP=$(kubectl get nodes --namespace default -o jsonpath="{.items[0].status.addresses[0].address}")`{{execute}}

`echo http://$NODE_IP:$NODE_PORT`{{execute}}

`curl http://$NODE_IP:$NODE_PORT`{{execute}}

## Add Portal for Container Registry ##

`kubectl create -f cluster/registry-ui`{{execute}}
