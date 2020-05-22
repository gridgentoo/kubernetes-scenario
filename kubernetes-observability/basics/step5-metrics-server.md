The de facto light monitoring application for Kubernetes is [metrics-server](https://github.com/kubernetes-incubator/metrics-server). Metrics Server is a metrics aggregator. It discovers all nodes on the cluster and queries each node’s kubelet for CPU and memory usage. There is no long term metrics storage, it holds just the latest metrics. Typically, the server may be installed with a Helm chart.

`helm install metrics-server stable/metrics-server \
--namespace kube-system \
--set args[0]="--kubelet-preferred-address-types=InternalIP" \
--set args[1]="--kubelet-insecure-tls"`{{execute}}

This will install the server in the kube-system namespace along with the last two parameters that allow it to work well in this ephemeral Katacoda cluster.

In a few minutes you should be able to list metrics using the following command:

`kubectl get --raw "/apis/metrics.k8s.io/v1beta1/nodes"`{{execute}}

If the metrics are not ready, this message will appear

> `Error from server (ServiceUnavailable): the server is currently unable to handle the request`

Once the metrics are ready, a JSON dump of the metrics will appear.

`kubectl top node`{{execute}}

If the metrics are not ready you may get this message.

> `Error from server (ServiceUnavaliable): the server is currently unable to handle the request (get nodes.metrics.k8s.io)`

However, once the metrics are available the normal message should look like this:

```
NAME     CPU(cores)   CPU%   MEMORY(bytes)   MEMORY%
master   125m         6%     1049Mi          55%
node01   84m          2%     922Mi           23%
```

Metrics information is also reflected in the dashboard. Launch the [Kubernetes dashboard](https://[[HOST_SUBDOMAIN]]-30000-[[KATACODA_HOST]].environments.katacoda.com/) and in pages for each resource the same Top information appears in the UI. The [Horizontal Pod Autoscalar](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/) also utilizes these vital metrics to make decisions to scale up and down Pod instances.

In the past, there was no _Resource Metrics API_ and a service called _Heapster_, now deprecated, used to gather all the cAdvisor metrics and bit more manually. Around the 1.6 to 1.8 Kubernetes releases the _Resource Metrics API_ was added. In concert, Heapster was removed and _Metrics Server_ is now the de facto service that aggregates metrics from the Metrics API.

Metrics-server is a lighter version of Heapster. It gathers the latest metrics for reference and does not store historical data. For the accumulation of trending metrics, the de facto Prometheus time-series database can optionally be added to a cluster.

The [exposed Resource Metrics API is documented here](https://github.com/kubernetes/community/blob/master/contributors/design-proposals/instrumentation/resource-metrics-api.md).

Another metric gathering server is [_kube-state-metrics_](https://github.com/kubernetes/kube-state-metrics#kube-state-metrics-vs-metrics-server). It is used to provide metrics information for [Prometheus](https://prometheus.io/). Once you need more metrics that are gathered over time, then typically Prometheus is added to the cluster.
