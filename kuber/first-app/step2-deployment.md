Задеплоим простое приложение под названием [_echoserver_](https://console.cloud.google.com/gcr/images/google-containers/GLOBAL/echoserver?gcrImageListsize=30).

`kubectl create -f echoserver.yaml`{{execute}}


> Проще всего сделать это с помощью команды **run**, но при этом создается только **Pod**. На самом деле мы хотим Задеплоить с помощью **ReplicaSet**.

> `kubectl run hello --image=k8s.gcr.io/echoserver:1.9 --generator=run-pod/v1 --port=8080`

Посмотрите на файлы **YAML**, которые определяют это приложение.

`cat echoserver.yaml`{{execute}}

Обратите внимание, что это не только определяет **kind: Deployment**, но внутри деплимента находится **ReplicaSet** для **Pod**, и этот **Pod** состоит из одного **Container**. **deployments,pods** - это предпочтительный способ развертывания приложений, а не просто установка **Pod**. Вы можете увидеть преимущество на следующем шаге, который масштабирует **scales** приложение.

Этоn контейнер всего около **44 МБ**, поэтому он загружается и запускается в течение нескольких минут. Убедитесь, что состояние **Available** изменяется с 0 на 1.

`kubectl get deployments,pods`{{execute}}

`watch kubectl get deployments,pods,services`{{execute}}

`watch kubectl get pods,services`{{execute}}

При этом **application** работает, но оно недоступно. Service необходим для доступа.