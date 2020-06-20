Добавьте репозиторий **Strimzi Helm Chart**:

`helm repo add strimzi https://strimzi.io/charts/`{{execute}}  

Создайте пространство имен **airflow **для цели установки.  

`kubectl create namespace kafka`{{execute}}  

Чтобы установить **Strimzi Helm Chart** с названием релиза my-release:

`helm install my-strimzi-kafka-operator strimzi/strimzi-kafka-operator --version 7.1.5 --namespace kafka -f values.yaml`{{execute}}

`watch kubectl get deployments,pods,services --namespace kafka`{{execute}}

#########################################

`helm search repo strimzi/strimzi-kafka-operator`{{execute}}  

`helm show values strimzi/strimzi-kafka-operatorw`{{execute}}

`helm show values strimzi/strimzi-kafka-operator > values.yaml`{{execute}}

`nano values.yaml`{{execute}}

###########################################


# Погрузимся глубже в исследовнание манифестов stable/rabbitmq-ha

Скачаем пакет stable/rabbitmq-ha

`helm pull strimzi/strimzi-kafka-operator --version 7.1.5`{{execute}}

`ll | grep strimzi-kafka-operator `{{execute}} 

`tar -zxvf strimzi-kafka-operator -7.1.5.tgz`{{execute}}

Смотрим Meta-данные

`cd strimzi-kafka-operator`{{execute}}

`ls`{{execute}}

`nano Chart.yaml`{{execute}}

Смотрим настройки helm

`nano values.yaml`{{execute}}

В папке templates лежат файлы **Манифестов**

`cd templates`{{execute}}

`ls`{{execute}}

Настройка манифеста configmap.yaml

`nano configmap.yaml`{{execute}}

Настройка манифеста persistence-storage-class.yaml

`nano persistence-storage-class.yaml`{{execute}}

Настройка манифеста service-account.yaml

`nano service-account.yaml`{{execute}}

Настройка манифеста role-binding.yaml

`nano role-binding.yaml`{{execute}}

Настройка манифеста stateful-set.yaml 

`nano stateful-set.yaml`{{execute}}

Настройка манифеста wal-storage-class.yaml

`nano wal-storage-class.yaml`{{execute}}

Настройка манифеста svc.yaml

`nano svc.yaml`{{execute}}


