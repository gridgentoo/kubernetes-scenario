Если вы проинспектируете **Pod**, то увидите, что запущенный контейнер версии 1.9.

`kubectl describe pod hello | grep "Image:"`{{execute}}

Более новая версия контейнера 1.10 в списке [here](https://console.cloud.google.com/gcr/images/google-containers/GLOBAL/echoserver?gcrImageListsize=30).

Важным аспектом **Kubernetes** является то, что ваши пользователи могут извлечь выгоду из идей [continuous deployment](https://martinfowler.com/bliki/ContinuousDelivery.html). Фундаментальный подход к этому - это **Kubernetes rollouts**.

Вот два подхода.

> Точный **surgical way**  с помощью команды **set image**. Это изменит версию **image** для контейнера в каждом Поде.

`kubectl set image deployment/hello hello=k8s.gcr.io/echoserver:1.10 --all`{{execute}}

Теперь осмотр **Pod** сообщит об обновленном контейнере.

`kubectl describe pod hello | grep "Image:"`{{execute}}

> Другой способ - изменить **YAML**, а затем применить изменение с помощью команды **update**.

Восстановите **Pod's container 3**    
**image the version** обратно в исходную версию

`kubectl replace -f echoserver.yaml`{{execute}}

Убедитесь, что версия была восстановлена **restored**.

`kubectl describe pod hello | grep "Image:"`{{execute}}

Затем найдите **resource**, измените **image version** с помощью **SED**, затем передайте измененный **pipe** в команду **kubectl replace**.

`kubectl get deployment hello -o yaml | sed 's/\(echoserver\):.*$/\1:1.10/' | kubectl replace -f -`{{execute}}

Убедитесь, что версия была обновлена с помощью команды **replace**.

`kubectl describe pod hello | grep "Image:"`{{execute}}
