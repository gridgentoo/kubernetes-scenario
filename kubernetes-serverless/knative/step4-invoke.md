Follow these commands to call the application.

Reveal the IP of the cluster and port for the Istio gateway to Knative.

`export ADDRESS=$(kubectl get node --output 'jsonpath={.items[0].status.addresses[0].address}'):$(kubectl get svc knative-ingressgateway --namespace istio-system --output 'jsonpath={.spec.ports[?(@.port==80)].nodePort}')`{{execute}}

Reveal the DNS name of the function.

`export SERVICE=$(kubectl get ksvc helloworld-go --output jsonpath='{.status.domain}')`{{execute}}

Confirm the locations have been discovered.

`echo Service $SERVICE is at $ADDRESS`{{execute}}

Invoke the function.

`curl -v -H "Host: $SERVICE" http://$ADDRESS`{{execute}}
