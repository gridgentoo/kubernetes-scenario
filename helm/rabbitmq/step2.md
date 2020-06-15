Создайте пространство имен для цели установки.

`kubectl create namespace rabbit`{{execute}}

Подготовить **Provisioning RabbitMQ** на **Kubernetes** легко, просто установите это [Helm chart](https://github.com/helm/charts/tree/master/stable/rabbitmq).

`helm install my-rabbit stable/rabbitmq-ha --namespace rabbit -f rabbit-values.yaml`{{execute}}

Для запуска контейнеров **RabbitMQ** требуется несколько минут. Чтобы получить полный статус обеспечения этой последовательности **provisioning this sequence**, выполните эту проверку.

`watch kubectl get deployments,pods,services --namespace rabbit`{{execute}}

Через несколько секунд **3 Pods** (RabbitMQ _Nodes_) с пометкой `pod/my-rabbit-rabbitmq-ha-[0|1|2]` появятся и перейдут в состояние **Running**. После того, как все запущено, перестаньте **watch**. Используйте это ```clear```{{execute interrupt}} , чтобы выйти из режима наблюдения **watch**  или нажмите <kbd>Ctrl</kbd>+<kbd>C</kbd>.


# Погрузимся глубже в исследовн=ание манифестов stable/rabbitmq-ha

Скачаем пакет stable/rabbitmq-ha

`helm pull stable/rabbitmq-ha`{{execute}}

`ll | grep kube`{{execute}} 

`tar -zxvf kube-ops-view-1.2.0.tgz`{{execute}}

Смотрим Meta-данные

`cd kube-ops-view`{{execute}}

`ls`{{execute}}

`nano Chart.yaml`{{execute}}

Смотрим настройки helm

`nano values.yaml`{{execute}}

В папке templates лежат файлы **Манифестов**

`cd templates`{{execute}}

`ls`{{execute}}

Настройка файла ingress.yaml

`nano ingress.yaml`{{execute}}

Настройка файла service.yaml

`nano service.yaml`{{execute}}

Настройка файла deployment.yaml

`nano deployment.yaml`{{execute}}
