### Set the credentials
Set these with the values from the http://cloud.elastic.co deployment:

```
vi ELASTIC_PASSWORD
vi ELASTIC_CLOUD_ID
```

and create a secret in the Kubernetes system level namespace:


`cd /root/course && kubectl create secret generic dynamic-logging \
--from-file=./ELASTIC_PASSWORD --from-file=./ELASTIC_CLOUD_ID \
--namespace=kube-system`{{execute HOST1}}


heapster is a container provided by Kubernetes to make metrics about Nodes, pods, etc. available.  If you ever ran `kubectl top pods` you have interacted with heapster. Metricbeat polls heapster for metrics and provides them to Elasticsearch. heapster can use various backends, we will deploy InfluxDB here.

