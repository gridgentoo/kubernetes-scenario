## Install Riff ##

Knative, by design, has no command-line interface. It's a server side framework that allows other platforms to produce their own clients and other ways of interacting with Knative and Kubernetes.

## Install Istio ##

`curl -L https://github.com/knative/serving/releases/download/v0.10.0/service-istio.yaml | sed 's/LoadBalancer/NodePort/' | kubectl apply --filename -`{{execute}}

`kubectl get pods --namespace istio-system`{{execute}}

Request Istio to inject its Envoy sidecars into applications deployed to the _default_ namespace.

`kubectl label namespace default istio-injection=enabled`{{execute}}

Notice Istio adds extensions (crds) to the Kubernetes API.

`kubectl get crds | grep .istio.`{{execute}}

## Installing Knative Serving ##

`curl -L https://github.com/knative/serving/releases/download/v0.10.0/serving-core.yaml | sed 's/LoadBalancer/NodePort/' | kubectl apply --filename -`{{execute}}

`kubectl get pods --namespace knative-serving`{{execute}}

Notice Knative adds extensions (crds) to the Kubernetes API.

`kubectl get crds | grep .knative.`{{execute}}

Now that Knative is running, the next step is to deploy and application.
