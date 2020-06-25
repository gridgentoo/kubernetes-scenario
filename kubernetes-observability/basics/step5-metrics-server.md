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

Информация о метриках **Metrics** также отражается в приборной панели **dashboard**. Запустите  [Kubernetes dashboard](https://[[HOST_SUBDOMAIN]]-30000-[[KATACODA_HOST]].environments.katacoda.com/), и на страницах для каждого ресурса в пользовательском интерфейсе появится та же самая верхняя **UI**. [Horizontal Pod Autoscalar](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/) также использует эти важные показатели для принятия решений о масштабировании и уменьшении экземпляров **Pod instances**.

В прошлом не было **Resource Metrics API** и службы под названием **Heapster**, которая в настоящее время устарела, использовалась для сбора всех метрик **cAdvisor** и немного больше вручную **manually**. Примерно с **1.6 to 1.8 Kubernetes** релизы был добавлен **Resource Metrics API**. В результате **Heapster** был удален, и **Metrics Server** теперь является де-факто сервисом, который объединяет метрики из **Metrics API**.

**Metrics-server** является более легкой версией **Heapster**.
 **Metrics-server** собирает последние метрики для справки и не хранит исторические данные **store historical data**. 
 Для накопления **trending metrics** можно добавить в кластер **de facto Prometheus time-series database**.

API метрик ресурсов описано здесь [exposed Resource Metrics API is documented here](https://github.com/kubernetes/community/blob/master/contributors/design-proposals/instrumentation/resource-metrics-api.md).

Другим сервером сбора метрик является [_kube-state-metrics_](https://github.com/kubernetes/kube-state-metrics#kube-state-metrics-vs-metrics-server).
Он используется для предоставления метрической информации для [Prometheus](https://prometheus.io/). 

Если вам нужно больше метрик, которые собираются со временем, то обычно **Prometheus** добавляется в кластер.
