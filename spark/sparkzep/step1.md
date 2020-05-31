### Инсталируем helm

`curl -LO https://storage.googleapis.com/kubernetes-helm/helm-v2.8.2-linux-amd64.tar.gz
tar -xvf helm-v2.8.2-linux-amd64.tar.gz
mv linux-amd64/helm /usr/local/bin/`{{execute}}

`helm init && helm repo update`{{execute}}

### Инсталируем  spark

Подробнее смотреть здесь: [spark chart](https://hub.helm.sh/charts/incubator/spark)


`helm repo add incubator https://kubernetes-charts-incubator.storage.googleapis.com`{{execute}}

`helm install incubator/spark --name sparkzep --version 0.1.1 --set Worker.Memory=256Mi`{{execute}}

Это займет несколько минут, чтобы раскрутить кластер spin up the cluster. Запустите, чтобы проверить, что все pods работают.

`k get all`{{execute}}


### Настройте типы Сервисов.

helm chart для этого развертывания, создает 2 ext LB's, но нам нужно изменить их на NodePorts

`k get svc sparkzep-spark-webui`{{execute}}

`k delete svc sparkzep-spark-webui`{{execute}}

`k create -f webui-svc.yaml`{{execute}}

и подключитесь по http к порту 32329, чтобы просмотреть статус  spark master (требуется минута или две, чтобы стартовать)

https://[[HOST_SUBDOMAIN]]-32329-[[KATACODA_HOST]].environments.katacoda.com

* обратите внимание, что web ui показывает порт 7077, k8s перенаправляет это на порт 32329  и что вы не можете подключиться ни к одному узлу

WIP: why are the worker nodes showing  1024, it should be 512?

И давайте настроим сервер **zepplin** для работы с **katacoda**

`k get svc sparkzep-zeppelin-contro`{{execute}}

`k delete svc sparkzep-zeppelin-contro`{{execute}}

`k create -f zeppelin-svc.yaml`{{execute}}

https://[[HOST_SUBDOMAIN]]-30466-[[KATACODA_HOST]].environments.katacoda.com





