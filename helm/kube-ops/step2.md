Скачаем пакет kube-ops-view

`helm pull stable/kube-ops-view`{{execute}}

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


