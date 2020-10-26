Создайте пространство имен для цели установки.

`kubectl create namespace ignite`{{execute}}

Смотрим какая версия сейчас актуальна:

`helm search repo ignite`{{execute}}

Редактируем values.yaml правим количество реплик например 3

`helm show values stable/ignite`{{execute}}

`helm show values stable/ignite > values.yaml`{{execute}}

`nano values.yaml`{{execute}}

Подготовить **Provisioning Apache Ignite** на **Kubernetes** легко, просто установите это [Helm chart](https://github.com/helm/charts/tree/master/stable/rabbitmq).

`helm install my-ignite stable/ignite --version 1.0.1 --namespace ignite -f values.yaml`{{execute}}

Для запуска контейнеров **Apache Ignite** требуется несколько минут. Чтобы получить полный статус обеспечения этой последовательности **provisioning this sequence**, выполните эту проверку.

`watch kubectl get deployments,pods,services --namespace ignite`{{execute}}

##########################################################################################

Через несколько секунд **3 Pods** (Apache Ignite _Nodes_) с пометкой `pod/my-ignite-memcached-[0|1|2]` появятся и перейдут в состояние **Running**. После того, как все запущено, перестаньте **watch**. Используйте это ```clear```{{execute interrupt}} , чтобы выйти из режима наблюдения **watch**  или нажмите <kbd>Ctrl</kbd>+<kbd>C</kbd>.

Редактируем **values.yaml** правим количество реплик например 2

`nano values.yaml`{{execute}}

Сделаем **upgrade** до 2 реплик

`helm install my-ignite stable/ignite --version 1.0.1 --namespace ignite -f values.yaml`{{execute}}


Для запуска 2 реплик **Apache Ignite** требуется несколько минут. Чтобы получить полный статус обеспечения этой последовательности **provisioning this sequence**, выполните эту проверку.
`watch kubectl get deployments,pods,services --namespace ignite`{{execute}}

# Погрузимся глубже в исследовнание манифестов stable/rabbitmq-ha

Скачаем пакет stable/rabbitmq-ha

`helm pull stable/ignite --version 1.0.1`{{execute}}

`ll | grep ignite`{{execute}} 

`tar -zxvf ignite-1.0.1.tgz`{{execute}}

Смотрим Meta-данные

`cd ignite`{{execute}}

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


