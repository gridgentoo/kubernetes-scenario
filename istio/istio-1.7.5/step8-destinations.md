## Apply default destination rules

Before you can use Istio to control the Bookinfo version routing, the destination rules need to define  the available versions, called subsets.

Create the default destination rules for the Bookinfo services:

`kubectl apply -f istio-$ISTIO_VERSION/samples/bookinfo/networking/destination-rule-all.yaml`{{execute}}

View the destination rules:

`kubectl get destinationrules`{{execute}}

There are rules for each service. For example, the rules for seeing the different review pages are this:

`kubectl get destinationrules reviews -o yaml | grep -B2 -A20 "host: reviews"`{{execute}}

With the networking complete, Istio will report no issues:

`istioctl analyze`{{execute}}
