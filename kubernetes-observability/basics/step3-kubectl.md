Состояние работоспособности приложения можно наблюдать **observed** с помощью различных команд **kubectl describe** для различных ресурсов **resources**.

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

> Note: Обратите внимание, что последнее событие будет отражать запрос на масштабирование **scaling request**.

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



