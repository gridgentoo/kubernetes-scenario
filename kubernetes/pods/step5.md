# Multi-Container Pods (Sidecar Pattern)

До сих пор мы работали с **Pod**, управляющим одним контейнером **single container**. Однако для некоторых шаблонов контейнеров **container patterns** (**sidecar**, **adapter** и **ambassador**) требуется более одного работающего контейнера в одном Поде.

ПРИМЕЧАНИЕ: Паттерны контейнера **sidecar** является очень распространенной практикой для **logging utilities**, **sync services**, **watchers**, и **monitoring agents**.

## Запустить Multi-Container Pod

Обычно мы запускаем поде в кластере **K8S** из файла, поскольку **infrastructure as code** обеспечивает прозрачность **transparency** и воспроизводимость **reproducibily**.

Изучите файл `nano ./resources/resources.multi-container.yaml`{{execute}} в браузере ресурсов.

Этот файл определяет простой контейнер **Alpine Linux** и контейнер **NGiNX.** Запустите под, развернув новый контейнер **NGiNX** с помощью команды **create**

`kubectl create -f ./resources/resources/multi-container.yaml`{{execute}}

Убедитесь, что новый под **pod-with-sidecar** запущен:

`kubectl get pods`{{execute}}

Может потребоваться несколько секунд, чтобы под **STATUS** изменился с **ContainerCreating** на **Running**..

Вы должны увидеть **output**, похожий на этот:

```
NAME               READY     STATUS    RESTARTS   AGE
pod-with-sidecar   2/2       Running   0          15s
```

Теперь давайте получим, немного больше информации:

`kubectl describe pod pod-with-sidecar`{{execute}}

## Label the Pod

Одна или несколько **labels** могут быть применины для пода.
**Labels** используются, чтобы помочь группировать различные объекты **Kubernetes** вместе. Применить **label** на **sidecar pod**:

`kubectl label pods pod-with-sidecar mycoollabel=awesome`{{execute}}

Чтобы показать **labels** на поде, используйте следующую команду:

`kubectl get pods --show-labels`{{execute}}

## Список всех контейнеров, работающие в Поде

Чтобы отобразить имена контейнеров, ассоциированных с подом, помеченным лейблом "mycoollabel=awesome":

`kubectl get pods -l mycoollabel=awesome -o jsonpath={.items[*].spec.containers[*].name}`{{execute}}

Вы должны увидеть следующие имена контейнеров:

* app-container
* sidecar-container

## Удалить Под

Теперь, когда мы закончили, давайте удалим наш Под: 

`kubectl delete -f ./resources/multi-container.yaml`{{execute}}

