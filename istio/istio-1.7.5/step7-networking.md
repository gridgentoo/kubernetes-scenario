Now that the Bookinfo services are up and running, we'll open a few forms of access to the application. Some of the service access techniques are private to the cluster, but we'll progress outward and open a public ingress path. 

## Private, Internal Access

Once running, the application's product page can be accessed internally to the cluster. You can access a service through the ClusterIP by invoking _curl_ from within one of the application Pods:

```bash
kubectl exec -it $(kubectl get pod -l app=ratings -o jsonpath='{.items[0].metadata.name}') \
  -c ratings \
  -- curl productpage:9080/productpage | grep -o "<title>.*</title>" && echo
```{{execute}}

You will see `<title>Simple Bookstore App</title>`. This call is just through the standard Kubernetes network and is not related to the Istio mesh.

## Mesh Gateway

When you have a collection of services that participate within the bounds of a mesh, then an entrance into that mesh would be defined with a Gateway. An Istio Gateway is used to define the ingress into the mesh. To access the Bookinfo application through the mesh, you'll make the following declaration.

`curl istio-$ISTIO_VERSION/samples/bookinfo/networking/bookinfo-gateway.yaml`{{execute}}

Notice there is a Gateway and a VirtualServices defined to open traffic to the product page. In this example the Gateway opens access to the product page service. Before you apply this Gateway, let's attempt to access the product page through the istio_ingressgateway to see it fail.

To access the Gateway a URL is forumlated. Determining the ingress IP and ports and set the INGRESS_HOST and INGRESS_PORT variables for accessing the gateway:

`export INGRESS_HOST=$(kubectl get po -l istio=ingressgateway -n istio-system -o jsonpath='{.items[0].status.hostIP}') && echo $INGRESS_HOST`{{execute}}

`export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].nodePort}') && echo $INGRESS_PORT`{{execute}}

Formulate the URL:

`export GATEWAY_URL=$INGRESS_HOST:$INGRESS_PORT && echo $GATEWAY_URL`{{execute}}

With this URL, but without the Gateway defined for access to the mesh this will return nothing:

`curl http://${GATEWAY_URL}/productpage | grep -o "<title>.*</title>"`{{execute}}

Define the ingress gateway for the application:

`kubectl apply -f istio-$ISTIO_VERSION/samples/bookinfo/networking/bookinfo-gateway.yaml`{{execute}}

Confirm the gateway has been created:

`kubectl get gateway`{{execute}}

Confirm the app is now accessible through the mesh Gateway:

`curl http://${GATEWAY_URL}/productpage | grep -o "<title>.*</title>"`{{execute}}

Again, you will see `<title>Simple Bookstore App</title>`.

This host address is local to the master node where Bash is running. Next, we'll access the app from a public URL.

## Ingress Service Connection to the Mesh Gateway

For public access the cloud systems load balancer needs to know where to send traffic. At this point access to the application from the public Katacoa scenario URL will not work. Try and see the error page:

https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/productpage

Let's open this access. The istio-ingressgateway is a Pod with a Service of the type _LoadBalancer_ that accepts this traffic. Currently the _external ip_ is stuck at pending which means a bridge is missing between the Katacoda load balancer and your scenario's ingress gateway service:

`kubectl get service istio-ingressgateway -n istio-system`{{execute}}

Notice the `EXTERNAL-IP` reports `<pending>`.

The IP where the _istio-ingressgateway_ is exposed is the master node:

`kubectl cluster-info | grep master`{{execute}}

To connect this bridge, add those host IP as the `externalIP` to the _istio-ingressgateway_ Service using the patch command:

`kubectl patch service -n istio-system istio-ingressgateway -p '{"spec": {"type": "LoadBalancer", "externalIPs":["[[HOST_IP]]"]}}'`{{execute}}

Verify the pending status has changed to the host IP:

`kubectl get service istio-ingressgateway -n istio-system`{{execute}}

It will show a status close to this.

```bash
NAME                   TYPE           CLUSTER-IP       EXTERNAL-IP   PORT(S)
istio-ingressgateway   LoadBalancer   10.103.192.174   [[HOST_IP]]   15021:31042/TCP,80:30136/TCP,443:32460/TCP,31400:31798/TCP,15443:30927/TCP
```

The full application web interface is now available from the _Bookinfo_ tab above the command line, or at this public Katacoda scenario address:

https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/productpage
