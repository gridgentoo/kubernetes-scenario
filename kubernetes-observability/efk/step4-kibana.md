Create a namespace for the installation target.

`kubectl create namespace logs`{{execute}}

Deploy Kibana. The service will be on a NodePort at 31000.

`helm install kibana stable/kibana --namespace=logs --set env.ELASTICSEARCH_HOSTS=http://elasticsearch-client:9200 --set service.type=NodePort --set service.nodePort=31000`{{execute}}

> Security caution. This NodePort exposes the logging to the outside world intentionally for demonstration purposes. However, for production Kubernetes clusters never expose the Kibana dashboard service to the world without any authentication.

Kibana is starting and will become available in a few minutes.
