Де-факто легким приложением для мониторинга в **Kubernetes** является [metrics-server](https://github.com/kubernetes-incubator/metrics-server). **Metrics Server** - это агрегатор метрик. Он обнаруживает все узлы в кластере и запрашивает у каждого узла **kubelet** использование процессора **CPU** и памяти. Не существует долгосрочного хранилища метрик **long term metrics storage**, оно содержит только самые последние метрики. Как правило, сервер может быть установлен с диаграммой Хелма.

Установим **Metrics Server**  с помощью **Helm chart**

`helm install metrics-server stable/metrics-server \
--namespace kube-system \
--set args[0]="--kubelet-preferred-address-types=InternalIP" \
--set args[1]="--kubelet-insecure-tls"`{{execute}}

Это установит сервер **Metrics Server** в пространство имен **kube-system** вместе с двумя последними параметрами, которые позволят ему хорошо работать в этом эфемерном кластере **Katacoda**.

Через несколько минут вы сможете составить список **metrics** с помощью следующей команды:

`kubectl get --raw "/apis/metrics.k8s.io/v1beta1/nodes"`{{execute}}

Если метрики не готовы, появится это сообщение

> `Error from server (ServiceUnavailable): the server is currently unable to handle the request`

Как только метрики будут готовы, появится **JSON dump** метрик.

`kubectl top node`{{execute}}

Если метрики не готовы, вы можете получить это сообщение.

> `Error from server (ServiceUnavaliable): the server is currently unable to handle the request (get nodes.metrics.k8s.io)`

Однако, как только метрики станут доступны, обычное сообщение должно выглядеть так:

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
