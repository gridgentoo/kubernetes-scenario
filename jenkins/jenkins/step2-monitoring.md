Для канареечного развертывания важно контролировать производительность и поведение вновь развернутых контейнеров, прежде чем принимать решение о продвижении новой версии или ее откате. Контейнеры можно контролировать с помощью **Prometheus**. Существует стабильная диаграмма **Helm**, которая устанавливает оператор **Prometheus** и некоторые нестандартные конфигурации поверх этого. Чтобы установить и настроить стек **Prometheus**, выполните следующие 3 команды:

`curl https://raw.githubusercontent.com/javajon/kubernetes-observability/master/configurations/prometheus-stack.sh | bash -s`{{execute}}

Приведенный выше сценарий включает команду ожидания, поэтому для его выполнения потребуется несколько минут.

Дорожная карта: необходимо добавить **ServiceMonitor** для очистки метрик hello-world. На данный момент показатели можно в основном увидеть в показателях ЦП и памяти узла. Рассмотрим эти два объявления ():

`kubectl create -n monitoring -f monitoring.yaml`{{execute}}

TODO: missing yaml
`kubectl create -n monitoring -f alertmanager-latency-rule.yaml`{{execute}}

Ниже приведены инструкции по настройке **Prometheus** для отслеживания производительности предстоящих развертываний hello-world. Но сначала давайте получим конвейер **Jenkins** для сборки, развертывания и установки приложения hello-world.

#####################################

Для **canary deployment** важно отслеживать производительность и поведение вновь **deployed containers**, прежде чем принять решение о продвижении новой версии или ее отмене **rolling it back**. Контейнеры можно контролировать с помощью **Prometheus**. Существует **stable Helm chart**, на которой установлен **Prometheus operator** и некоторые продуманные конфигурации. 

Приведенный выше скрипт включает команду ожидания **wait command**, поэтому для ее завершения потребуется несколько минут.

**Roadmap**: необходимо добавить **ServiceMonitor** для очистки показателе **hello-world metrics**. На данный момент **metrics** можно в значительной степени увидеть в метриках **node CPU** and **memory metrics**. Рассмотрим эти два **declarations** ():

Создайте пространство имен для цели установки.
Создайте пространство имен **monitoring** для цели установки.

`kubectl create namespace monitoring`{{execute}}

`helm search repo prometheus-operator`{{execute}}

`helm search repo kube-prometheus`{{execute}}

`helm show values stable/prometheus-operator > values.yaml`{{execute}}

Откроем в редакторе файл **values.yaml**.

`nano values.yaml`{{execute}}

Нажмите **CTRL-X to exit** для выхода из режима **редактирования**.

Чтобы установить **prometheus-operator*

`helm install stable/prometheus-operator --version 9.3.1 --namespace monitoring -f values.yaml`{{execute}}

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
