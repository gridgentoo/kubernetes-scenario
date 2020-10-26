Создайте пространство имен для цели установки.

`kubectl create namespace rabbit`{{execute}}

Смотрим какая версия сейчас актуальна:

`helm search hub rabbitmq`{{execute}}

Редактируем rabbit-values.yaml правим количество реплик например 3

`nano rabbit-values.yaml`{{execute}}

Подготовить **Provisioning RabbitMQ** на **Kubernetes** легко, просто установите это [Helm chart](https://github.com/helm/charts/tree/master/stable/rabbitmq).

`helm install my-rabbit stable/rabbitmq-ha --version 1.46.2 --namespace rabbit -f rabbit-values.yaml`{{execute}}

Для запуска контейнеров **RabbitMQ** требуется несколько минут. Чтобы получить полный статус обеспечения этой последовательности **provisioning this sequence**, выполните эту проверку.

`watch kubectl get deployments,pods,services --namespace rabbit`{{execute}}

Через несколько секунд **3 Pods** (RabbitMQ _Nodes_) с пометкой `pod/my-rabbit-rabbitmq-ha-[0|1|2]` появятся и перейдут в состояние **Running**. После того, как все запущено, перестаньте **watch**. Используйте это ```clear```{{execute interrupt}} , чтобы выйти из режима наблюдения **watch**  или нажмите <kbd>Ctrl</kbd>+<kbd>C</kbd>.

Редактируем **rabbit-values.yaml** правим количество реплик например 5

`nano rabbit-values.yaml`{{execute}}

Сделаем **upgrade** до 5 реплик

`helm upgrade my-rabbit stable/rabbitmq-ha --version 1.46.2 --namespace rabbit -f rabbit-values.yaml`{{execute}}

Для запуска 5 реплик **RabbitMQ** требуется несколько минут. Чтобы получить полный статус обеспечения этой последовательности **provisioning this sequence**, выполните эту проверку.
`watch kubectl get deployments,pods,services --namespace rabbit`{{execute}}

# Погрузимся глубже в исследовнание манифестов stable/rabbitmq-ha

Скачаем пакет stable/rabbitmq-ha

`helm pull stable/rabbitmq-ha --version 1.46.1`{{execute}}
`helm pull stable/rabbitmq-ha --version 1.46.2`{{execute}}

`ll | grep rabbitmq-ha`{{execute}} 

`tar -zxvf rabbitmq-ha-1.46.2.tgz`{{execute}}

Смотрим Meta-данные

`cd rabbitmq-ha`{{execute}}

`ls`{{execute}}

`nano Chart.yaml`{{execute}}

Смотрим настройки helm

`nano values.yaml`{{execute}}

В папке templates лежат файлы **Манифестов**

`cd templates`{{execute}}

`ls`{{execute}}

Настройка манифеста ingress.yaml

`nano ingress.yaml`{{execute}}

Настройка манифеста service.yaml

`nano service.yaml`{{execute}}

Настройка манифеста deployment.yaml

`nano deployment.yaml`{{execute}}

Настройка манифеста configmap.yaml

`nano configmap.yaml`{{execute}}

Настройка манифеста secret.yaml

`nano secret.yaml`{{execute}}

Настройка манифеста service-discovery.yaml

`nano service-discovery.yaml`{{execute}}

Настройка манифеста service.yaml

`nano service.yaml`{{execute}}

Настройка манифеста statefulset.yaml

`nano statefulset.yaml`{{execute}}
