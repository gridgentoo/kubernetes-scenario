Если вы проинспектируете **Pod**, то увидите, что запущенный контейнер версии 1.9.

`kubectl describe pod hello | grep "Image:"`{{execute}}

Более новая версия контейнера 1.10 в списке [here](https://console.cloud.google.com/gcr/images/google-containers/GLOBAL/echoserver?gcrImageListsize=30).

Важным аспектом **Kubernetes** является то, что ваши пользователи могут извлечь выгоду из идей [continuous deployment](https://martinfowler.com/bliki/ContinuousDelivery.html). Фундаментальный подход к этому - это **Kubernetes rollouts**.

Вот два подхода.

1. Точный **surgical way**  с помощью команды **set image**. Это изменит версию **image** для контейнера в каждом Поде.

`kubectl set image deployment/hello hello=k8s.gcr.io/echoserver:1.10 --all`{{execute}}

Теперь осмотр **Pod** сообщит об обновленном контейнере.

`kubectl describe pod hello | grep "Image:"`{{execute}}

2. Another way is to modify the YAML then apply the change with the _update_ command.

Restore the Pod's container 3
image the version back to the original version

`kubectl replace -f echoserver.yaml`{{execute}}

Verify the version has been restored.

`kubectl describe pod hello | grep "Image:"`{{execute}}

Then, look up the resource, change the image version with SED, then pipe modified stream to the _replace_ command.

`kubectl get deployment hello -o yaml | sed 's/\(echoserver\):.*$/\1:1.10/' | kubectl replace -f -`{{execute}}

Verify the version has been upgraded using the _replace_ command.

`kubectl describe pod hello | grep "Image:"`{{execute}}
