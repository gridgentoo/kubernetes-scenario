Добавьте репозиторий **Strimzi Helm Chart**:

`helm repo add strimzi https://strimzi.io/charts/`{{execute}} 

##################################################

`helm search repo strimzi/strimzi-kafka-operator`{{execute}} 

`ls`{{execute}}

`helm show values strimzi/strimzi-kafka-operator`{{execute}}

Отправим манифест **values.yaml`** с пмощью пайпа **pipe** в файл **values.yaml**.

`helm show values strimzi/strimzi-kafka-operator > values.yaml`{{execute}}

`ls`{{execute}}

`nano values.yaml`{{execute}}

Нажмите **CTRL-X to exit** для выхода из режима **редактирования**.

##################################################

Создайте пространство имен **airflow **для цели установки.  

`kubectl create namespace kafka`{{execute}}  

Чтобы установить **Strimzi Helm Chart** с названием релиза **my-strimzi-kafka-operator**:

`helm install my-strimzi-kafka-operator strimzi/strimzi-kafka-operator --version 0.18.0 --namespace kafka -f values.yaml`{{execute}}

Кликните **Click** на команду **watch** ниже, и подождите, когда **Kubernetes nodes** будут готовы.

`watch kubectl get deployments,pods,services --namespace kafka`{{execute}}

##################################################

Когда все **nodes**  показывают статус **Running**, нажмите
```clear```{{execute interrupt}} 

или **CTRL-C to exit** для выхода из режима **watch**.

##################################################

# Погрузимся глубже в исследовнание манифестов strimzi-kafka-operator

Скачаем несколько пакетов **strimzi-kafka-operator**, различных версий:

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


