Создайте пространство имен для цели установки.

`kubectl create namespace mcrouter`{{execute}}

Смотрим какая версия сейчас актуальна:

`helm search hub mcrouter`{{execute}}

Редактируем values.yaml правим количество реплик например 3

`helm show values stable/mcrouter`{{execute}}

`helm show values stable/mcrouter > values.yaml`{{execute}}

`nano values.yaml`{{execute}}

Подготовить **Provisioning RabbitMQ** на **Kubernetes** легко, просто установите это [Helm chart](https://github.com/helm/charts/tree/master/stable/rabbitmq).

`helm install my-mcrouter stable/mcrouter --version 1.0.2 --namespace mcrouter -f values.yaml`{{execute}}

Для запуска контейнеров **RabbitMQ** требуется несколько минут. Чтобы получить полный статус обеспечения этой последовательности **provisioning this sequence**, выполните эту проверку.

`watch kubectl get deployments,pods,services --namespace mcrouter`{{execute}}

##########################################################################################

Через несколько секунд **3 Pods** (RabbitMQ _Nodes_) с пометкой `pod/my-mcrouter-memcached-[0|1|2]` появятся и перейдут в состояние **Running**. После того, как все запущено, перестаньте **watch**. Используйте это ```clear```{{execute interrupt}} , чтобы выйти из режима наблюдения **watch**  или нажмите <kbd>Ctrl</kbd>+<kbd>C</kbd>.

Редактируем **values.yaml** правим количество реплик например 2

`nano values.yaml`{{execute}}

Сделаем **upgrade** до 2 реплик




Для запуска 2 реплик **RabbitMQ** требуется несколько минут. Чтобы получить полный статус обеспечения этой последовательности **provisioning this sequence**, выполните эту проверку.
`watch kubectl get deployments,pods,services --namespace mcrouter`{{execute}}

# Погрузимся глубже в исследовнание манифестов stable/rabbitmq-ha

Скачаем пакет stable/rabbitmq-ha

`helm pull stable/mcrouter --version 1.0.2`{{execute}}
`helm pull stable/mcrouter --version 1.0.1`{{execute}}

`ll | grep mcrouter`{{execute}} 

`tar -zxvf mcrouter-1.0.2.tgz`{{execute}}

Смотрим Meta-данные

`cd mcrouter`{{execute}}

`ls`{{execute}}

`nano Chart.yaml`{{execute}}

Смотрим настройки helm

`nano values.yaml`{{execute}}

В папке templates лежат файлы **Манифестов**

`cd templates`{{execute}}

`ls`{{execute}}

Настройка манифеста configmap.yaml

`nano configmap.yaml`{{execute}}

Настройка манифеста configmap.yaml

`nano daemonset.yaml`{{execute}}

Настройка манифеста statefulset.yaml

`nano statefulset.yaml`{{execute}}

Настройка манифеста svc.yaml

`nano svc.yaml`{{execute}}
