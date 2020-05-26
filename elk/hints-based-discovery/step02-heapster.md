Heapster позволяет мониторить контейнерный кластер и анализировать производительность для Kubernetes (версия v1.0.6 и выше). 
Heapster предлагает статистику использования кластера через консоль, а также добавит больше информации о ресурсах нод и подов на панель Kubernetes Dashboard.

### Клонировать репозиторий heapster repo:

`git clone https://github.com/kubernetes/heapster.git /root/course/heapster`{{execute HOST1}}

### Задеплойте InfluxDB, Grafana, и heapster

`kubectl create -f /root/course/heapster/deploy/kube-config/influxdb/`{{execute HOST1}}

### Конфигурирем RBAC для heapster

`kubectl create -f /root/course/heapster/deploy/kube-config/rbac/heapster-rbac.yaml`{{execute HOST1}}

### Проверьте что heapster доступен

Вы должны увидеть один запущенный модуль heapster pod:

`kubectl get pods -n kube-system | grep -E "monitoring|heapster"`{{execute HOST1}}

