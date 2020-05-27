## Persistent Volume ##

ElasticSearch будет делать PersistentVolumeClaim за его persistence. Будет необходим PersistentVolume - постоянный объем. Поскольку все это временно в Katacoda, PersistentVolume создается на основе [hostPath based PersistentVolume](https://kubernetes.io/docs/tasks/configure-pod-container/configure-persistent-volume-storage/#create-a-persistentvolume).

`mkdir -p /mnt/data/efk-master && kubectl create -f pv-master.yaml`{{execute}}

`mkdir -p /mnt/data/efk-data && kubectl create -f pv-data.yaml`{{execute}}

## Install ElasticSearch ##

Создайте пространство имен namespace для цели установки.

`kubectl create namespace logs`{{execute}}

Разверните общедоступную Helm chart для ElasticSearch. Параметры chart's по умолчанию должным образом учтены для production deployment. Здесь некоторые параметры по умолчанию уменьшены для соответствия этому кластеру Katacoda.

`helm install elasticsearch stable/elasticsearch --namespace=logs \
--set client.replicas=1 \
--set master.replicas=1 \
--set cluster.env.MINIMUM_MASTER_NODES=1 \
--set cluster.env.RECOVER_AFTER_MASTER_NODES=1 \
--set cluster.env.EXPECTED_MASTER_NODES=1 \
--set data.replicas=1 \
--set data.heapSize=300m \
--set master.persistence.storageClass=elasticsearch-master \
--set master.persistence.size=5Gi \
--set data.persistence.storageClass=elasticsearch-data \
--set data.persistence.size=5Gi`{{execute}}

Elasticsearch запускается и станет доступным через несколько минут. А пока перейдите к следующему шагу установки.
