### Установите учетные данные credentials
Установите их со значениями из развертывания http://cloud.elastic.co deployment:

```
vi ELASTIC_PASSWORD
vi ELASTIC_CLOUD_ID
```

и создайте secret в пространстве имен системного уровня Kubernetes:

`cd /root/course && kubectl create secret generic dynamic-logging \
--from-file=./ELASTIC_PASSWORD --from-file=./ELASTIC_CLOUD_ID \
--namespace=kube-system`{{execute HOST1}}

heapster - это контейнер, предоставляемый Kubernetes для предоставления метрик об  Nodes, pods, etc. т. д. Если вы когда-либо запускали `kubectl top pods`, вы взаимодействовали с heapster. Metricbeat опрашивает метрики и предоставляет их Elasticsearch. heapster может использовать различные бэкэнды, здесь мы развернем InfluxDB.

