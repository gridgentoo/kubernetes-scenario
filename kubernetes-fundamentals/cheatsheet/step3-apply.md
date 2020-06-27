## Apply

**apply** управляет приложениями с помощью файлов, которые определяют ресурсы **Kubernetes**. Выполните команду **kubectl apply** для создания и обновления ресурсов. 
Это рекомендуемый способ управления приложениями **Kubernetes** в промышленном окружении. Смотрите [Kubectl Book](https://kubectl.docs.kubernetes.io).

## Создание объектов

Манифесты **Kubernetes** могут быть определены в **YAML** или **JSON**. Можно использовать расширение файла `.yaml`, `.yml` и `.json`

создать ресурсы

`kubectl apply -f ./my-manifest.yaml`{{execute}}

создать ресурсы из нескольких файлов

`kubectl apply -f ./my1.yaml -f ./my2.yaml`{{execute}}

создать ресурсы из всех файлов манифеста в директории

`kubectl apply -f ./dir`{{execute}}

создать ресурсы из URL-адреса

`kubectl apply -f https://git.io/vPieo`{{execute}}

запустить один экземпляр nginx

`kubectl create deployment nginx --image=nginx`{{execute}}

посмотреть документацию по манифестам подов

`kubectl explain pods`{{execute}}
                           



### Состояние работоспособности приложения можно наблюдать **observed** с помощью различных команд **kubectl describe** для различных ресурсов **resources**.

**Inspect** весь кластер

`kubectl cluster-info`{{execute}}

или более многословный вывод 

`kubectl cluster-info dump --all-namespaces`{{execute}}

нажмите ```clear```{{execute interrupt}} 

**Inspect** этот кластер **Kubernetes** только **Worker node**.

`kubectl describe node node01`{{execute}}

**Inspect** - проверьте последний **deployment**. 

`kubectl describe deployment random-logger`{{execute}}

нажмите ```clear```{{execute interrupt}} 

В частности, состояние реплики **replica state**.

`kubectl describe deployments | grep "Replicas:"`{{execute}}

`kubectl describe deployments | grep "Labels:"`{{execute}}

`kubectl describe deployments | grep "StrategyType:"`{{execute}}

нажмите ```clear```{{execute interrupt}} 

**Inspect** - проверем еще **3 pods**.

`kubectl get pods`{{execute}}

`kubectl describe pods`{{execute}}

## Events ##

Кубернетес также ведет список **events**.

`kubectl get events`{{execute}}

нажмите ```clear```{{execute interrupt}} 

**Scaling** (Масштабирование) - это тип события. Уменьшите количество **Pod** с 3 до 2.

`kubectl scale deployment/random-logger --replicas=2`{{execute}}

`kubectl get pods`{{execute}}

нажмите ```clear```{{execute interrupt}} 

или **CTRL-C to exit** для выхода из режима 

> Note: Обратите внимание, что последнее событие будет отражать запрос на масштабирование **scaling request**. > **ScalingReplicaSet** 

`kubectl get events --sort-by=.metadata.creationTimestamp`{{execute}}

Эти события не следует путать с [журналами аудита безопасности](https://kubernetes.io/docs/tasks/debug-application-cluster/audit/), которые также записываются.

## Inspecting Containers ##

Вы также можете попасть внутрь работающего контейнера и осмотреть **inspect** его. Давайте получим в переменную имя первого **Pod**.

`POD=$(kubectl get pod  -o jsonpath="{.items[0].metadata.name}")`{{execute}}

Напечатаем в терминале имя **POD**

`echo $POD`{{execute}}

**Inspect** проверьте содержимое скрипта внутри файловой системы контейнера.

`kubectl exec $POD -- cat entrypoint.sh`{{execute}}

Или, **shell** внутрь контейнера.

`kubectl exec -it $POD -- /bin/sh`{{execute}}

выйдете из контенера **$POD** командой **exit**.



