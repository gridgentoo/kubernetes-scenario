Для **canary deployment** важно отслеживать производительность и поведение вновь **deployed containers**, прежде чем принять решение о продвижении новой версии или ее отмене **rolling it back**. Контейнеры можно контролировать с помощью **Prometheus**. Существует **stable Helm chart**, на которой установлен **Prometheus operator** и некоторые продуманные конфигурации. 

Приведенный выше скрипт включает команду ожидания **wait command**, поэтому для ее завершения потребуется несколько минут.

**Roadmap**: необходимо добавить **ServiceMonitor** для очистки показателе **hello-world metrics**. На данный момент **metrics** можно в значительной степени увидеть в метриках **node CPU** and **memory metrics**. Рассмотрим эти два **declarations** ():

Создайте пространство имен для цели установки.

`kubectl create namespace monitoring`{{execute}}

`helm search repo prometheus-operator`{{execute}}
`helm search repo kube-prometheus`{{execute}}


helm show values stable/prometheus-operator > values.yaml

Подготовить **Provisioning RabbitMQ** на **Kubernetes** легко, просто установите это [Helm chart](https://github.com/helm/charts/tree/master/stable/rabbitmq).

`helm install stable/prometheus-operator --name prometheus-operator --namespace monitoring -f values.yaml`{{execute}}

####################################################
`curl https://raw.githubusercontent.com/javajon/kubernetes-observability/master/configurations/prometheus-stack.sh | bash -s`{{execute}}

```
helm install stable/prometheus-operator --name prometheus-operator --namespace monitoring
helm install stable/kube-prometheus     --name kube-prometheus     --namespace monitoring --wait

helm install coreos/prometheus-operator --name prometheus-operator --namespace monitoring
helm install coreos/kube-prometheus     --name kube-prometheus     --namespace monitoring --wait

kubectl patch service kube-prometheus              --namespace=monitoring --type='json' -p='[{"op": "replace",  "path": "/spec/type", "value":"NodePort"}]'
kubectl patch service kube-prometheus-alertmanager --namespace=monitoring --type='json' -p='[{"op": "replace",  "path": "/spec/type", "value":"NodePort"}]'
kubectl patch service kube-prometheus-grafana      --namespace=monitoring --type='json' -p='[{"op": "replace",  "path": "/spec/type", "value":"NodePort"}]'

minikube service list -n monitoring
```
####################################################

`kubectl create -n monitoring -f monitoring.yaml`{{execute}}

TODO: пропал **missing yaml**
`kubectl create -n monitoring -f alertmanager-latency-rule.yaml`{{execute}}

Ниже приведены инструкции, которые **configure Prometheus** для наблюдения **watch** за производительностью будущих deployments. 
Но сначала давайте возьмем **Jenkins pipeline** для сборки, развертывания и установки приложения.