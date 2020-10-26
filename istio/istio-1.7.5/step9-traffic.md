Now that you have Istio and a sample application running let's explore what we can do with it. One of the main features of Istio is traffic management. As a Microservice architectures grow, so too grows the need for more advanced control of service-to-service communications.

## User Based Testing / Request Routing

Traffic can be controlled and routed based on information in the HTTP request headers. Routing decisions can be made based on the presence of data such as user agent strings, key/values, IP addresses, or cookies.

This next example will send all traffic for the user _jason_ to the reviews:v2, meaning that user will only see the black stars. A declaration in the VirtualServer defines this rule:

`ccat istio-$ISTIO_VERSION/samples/bookinfo/networking/virtual-service-reviews-test-v2.yaml`{{execute}}

Similarly to deploying Kubernetes configuration, routing rules can be applied using istioctl:

`kubectl apply -f istio-$ISTIO_VERSION/samples/bookinfo/networking/virtual-service-reviews-test-v2.yaml`{{execute}}

Click on the Bookinfo tab to visit the product page. On the top-right sign in as user _jason_.

## Traffic Shaping for Canary Releases

The ability to split traffic for testing and rolling out changes is important. This allows for A/B variation testing or deploying canary releases.

The rule below ensures that 50% of the traffic goes to reviews:v1 (no stars), or reviews:v3 (red stars):

`ccat istio-$ISTIO_VERSION/samples/bookinfo/networking/virtual-service-reviews-50-v3.yaml`{{execute}}

Apply this traffic splitting rule:

`kubectl apply -f istio-$ISTIO_VERSION/samples/bookinfo/networking/virtual-service-reviews-50-v3.yaml`{{execute}}

Logout of user Jason otherwise the above configuration will take priority

The weighting is not round robin, multiple requests may go to the same service, but over multiple calls the statistics eventually work out.

## New Releases

Given the above approach, if the canary release were successful then we'd want to move 100% of the traffic to reviews:v3:

`ccat istio-$ISTIO_VERSION/samples/bookinfo/networking/virtual-service-reviews-v3.yaml`{{execute}}

This can be done by updating the route with new weighting and rules:

`kubectl apply -f istio-$ISTIO_VERSION/samples/bookinfo/networking/virtual-service-reviews-v3.yaml`{{execute}}

## IstioCtl Inspection

The istioctl tool has commands for inspection. To list all the envoy sidecars run using this:

`istioctl proxy-status`{{execute}}

The istioctl [`describe`](https://istio.io/latest/docs/ops/diagnostic-tools/istioctl-describe/) and [`analyze`](https://istio.io/latest/docs/ops/diagnostic-tools/istioctl-analyze/) commands provide ways for you to investigate the mesh rules and configurations.

`istioctl analyze --help`{{execute}}

However, let's get to some of the dashboards for more inspections.
    