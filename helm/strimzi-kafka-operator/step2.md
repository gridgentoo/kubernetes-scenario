Добавьте репозиторий **Strimzi Helm Chart**:

`helm repo add strimzi https://strimzi.io/charts/`{{execute}} 


##################################################

`helm search repo strimzi/strimzi-kafka-operator`{{execute}} 

`ls`{{execute}}

`helm show values strimzi/strimzi-kafka-operator`{{execute}}

`helm show values strimzi/strimzi-kafka-operator > values.yaml`{{execute}}

`nano values.yaml`{{execute}}

##################################################

Создайте пространство имен **airflow **для цели установки.  

`kubectl create namespace kafka`{{execute}}  

Чтобы установить **Strimzi Helm Chart** с названием релиза my-release:

`helm install my-strimzi-kafka-operator strimzi/strimzi-kafka-operator --version 0.18.0 --namespace kafka -f values.yaml`{{execute}}

`watch kubectl get deployments,pods,services --namespace kafka`{{execute}}

##################################################

# Погрузимся глубже в исследовнание манифестов stable/rabbitmq-ha

Скачаем пакет stable/rabbitmq-ha

`helm pull strimzi/strimzi-kafka-operator --version 0.16.0`{{execute}}

`helm pull strimzi/strimzi-kafka-operator --version 0.17.0`{{execute}}

`helm pull strimzi/strimzi-kafka-operator --version 0.18.0`{{execute}}

`ll | grep strimzi-kafka-operator `{{execute}} 

`tar -zxvf strimzi-kafka-operator-helm-chart-0.18.0.tgz`{{execute}}

Смотрим Meta-данные

`cd strimzi-kafka-operator`{{execute}}

`ls`{{execute}}

`nano Chart.yaml`{{execute}}

Смотрим настройки helm

`nano values.yaml`{{execute}}

В папке templates лежат файлы **Манифестов**

`cd templates`{{execute}}

`ls`{{execute}}

Настройка манифестов


