The _echoserver_ container is running in a Pod. Each Pod in Kubernetes is assigned an internal and virtual IP address at 10.xx.xx.xx. However, from outside of the cluster these IPs are not addressable, and never should be. Even within the cluster other applications normally should not attempt to address these Pods IPs. Instead each replicated Pod is fronted by a single service.

This service can be referenced by its label, and therefore access with the help of an internal Domain Name System (DNS) that will resolve the URL to the service based on the label. The Service will add a layer of indirection where it will know how to connect to the Pod. All the other applications in the cluster will connect to the service through DNS lookups and the services will connect to the specific Pods.

Expose the Pod by fronting it with a Service labeled _hello_.

`kubectl expose deployment hello --type=NodePort`{{execute}}

`kubectl get service hello`{{execute}}

The NodePort is assigned a port value at some free port above 30000. For this Katacoda example, we need it to be at a definitive value, here we choose 31001. Use the _patch_ command to change the _hello_ service NodePort from its random value to the chosen, fixed value.

`kubectl patch service hello --type='json' --patch='[{"op": "replace", "path": "/spec/ports/0/nodePort", "value":31001}]'`{{execute}}

The service NodePort is now adjusted.

`kubectl get service hello`{{execute}}

`kubectl describe service hello`{{execute}}

Because of Katacoda's virtualization, you cannot address this service from your browser, but you can use Katacoda's domain as the URL to the same service. Notice the same port number placed in the subdomain of the URL.

`curl -s https://[[HOST_SUBDOMAIN]]-31001-[[KATACODA_HOST]].environments.katacoda.com/`{{execute}}
