### Clone the heapster repo:

`git clone https://github.com/kubernetes/heapster.git /root/course/heapster`{{execute HOST1}}

### Deploy InfluxDB, Grafana, and heapster

`kubectl create -f /root/course/heapster/deploy/kube-config/influxdb/`{{execute HOST1}}

### Configure RBAC for heapster

`kubectl create -f /root/course/heapster/deploy/kube-config/rbac/heapster-rbac.yaml`{{execute HOST1}}

### Verify that heapster is available

You should see one running heapster pod:

`kubectl get pods -n kube-system | grep -E "monitoring|heapster"`{{execute HOST1}}

