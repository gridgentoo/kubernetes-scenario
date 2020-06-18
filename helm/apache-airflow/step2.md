`helm search repo airflow`{{execute}}  

`helm show values stable/airflow`{{execute}}

`helm show values stable/airflow > values.yaml`{{execute}}

`nano values.yaml`{{execute}}

Создайте пространство имен **airflow **для цели установки.  

`kubectl create namespace airflow`{{execute}}   

`helm install my-airflow stable/airflow --version 7.1.5 --namespace airflow -f values.yaml`{{execute}}

`watch kubectl get deployments,pods,services --namespace airflow`{{execute}}

# Погрузимся глубже в исследовнание манифестов stable/rabbitmq-ha

Скачаем пакет stable/rabbitmq-ha

`helm pull stable/airflow --version 7.1.5`{{execute}}

`ll | grep airflow`{{execute}} 

`tar -zxvf airflow-7.1.5.tgz`{{execute}}

Смотрим Meta-данные

`cd airflow`{{execute}}

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


