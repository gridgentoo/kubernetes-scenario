## Persistent Volume ##

ElasticSearch will be making a PersistentVolumeClaim for its persistence. A PersistentVolume will be needed. Since this is all temporary in Katacoda, a [hostPath based PersistentVolume](https://kubernetes.io/docs/tasks/configure-pod-container/configure-persistent-volume-storage/#create-a-persistentvolume) is created.

`mkdir -p /mnt/data/efk-master && kubectl create -f pv-master.yaml`{{execute}}

`mkdir -p /mnt/data/efk-data && kubectl create -f pv-data.yaml`{{execute}}

## Install ElasticSearch ##

Create a namespace for the installation target.

`kubectl create namespace logs`{{execute}}

Deploy the public Helm chart for ElasticSearch. The chart's default settings are appropriately opinionated for a production deployment. Here, some of the default settings are downsized to fit in this Katacoda cluster.

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

ElasticsSearch is starting and will become available in a few minutes. In the meantime, move onto the next installation step.
