**Pods**  - это базовый примитив, который **Kubernetes** использует для управления контейнеризованными приложениями. Мы можем легко создать **Pod** на **CLI**:

`kubectl run nginx --image=nginx --port=80 --restart=Never`{{execute}}

Начнем с **kubectl run**. Это указывает **Kubernetes** на создание ресурса Под. 
Первый параметр, **nginx**`, предоставляет имя Пода. 
После этого **--image=nginx** указывает **Kubernetes** создать Под, который запускает контейнер на основе изображения **nginx image**. 
Параметр **--port = 80** указывает **Kubernetes**, чтобы базовый контейнер прослушивал порт 80. 
Параметр **--restart = Never** указывает **Kubernetes** не перезапускать Под.

## Список запущенных Pods

Теперь, когда у нас есть **Pod**, мы можем увидеть его в действии, используя глагол **get**:

`kubectl get pods`{{execute}}

> *NOTE*: **po** это сокращение от **pods,** так что это тоже работает: `kubectl get po`

`k get po`{{execute}}

Мы можем видеть, что у нас есть один **Pod** со статусом **status of running**:

```
NAME      READY     STATUS    RESTARTS   AGE
nginx     1/1       Running   0          10s
```

> *NOTE*: **kubectl** - это распространенная команда **Kubernetes**, которую мы будем использовать на протяжении всего обучения.

`watch kubectl get deployments,pods,services`{{execute}}

`watch kubectl get pods,services`{{execute}}

Используйте это ```clear```{{execute interrupt}} чтобы выйти из режима наблюдения или нажмите <kbd>Ctrl</kbd>+<kbd>C</kbd>.

## Инспекция running Pods

Часто нам нужно проинспектировать работающие объекты **Kubernetes**. Для этого мы используем глагол **describe**.

**kubectl describe** дает нам больше информации о любом объекте **Kubernetes**.

Чтобы показать подробную информацию о нашем запущенном **Pod**, используйте:

`kubectl describe pods nginx`{{execute}}

Мы можем сделать цепочку из команду, чтобы получить более детализированные детали:

`kubectl describe pod nginx | grep IP | awk '{print $2}'`{{execute}}

Это получит IP-адрес нашего **nginx Pod**. В общем, вы не будете создавать **Pod** с помощью **CLI**. 
Однако понимание того, как получить от них информацию, чрезвычайно важно.

Мы видим, что наш **Pod** имеет уникальный **IP**-адрес, который мы будем использовать через секунду. Прямо сейчас наш Под, был **scheduled** на **node01**:

`kubectl describe pod nginx | grep Node | awk '{print $2}'`{{execute}}

Давайте сделаем SSH коннект к этой Ноде:

`ssh node01`{{execute}}

На самом деле мы можем видеть контейнер с **Docker**:

`docker container ls | grep k8s_nginx`{{execute}}

Давайте проверим этот контейнер с помощью `docker container inspect`{{execute}}, за которым следует имя контейнера. 

Мы уже получили **IP**-адрес Под, поэтому давайте загрузим файлы из **NGINX**, используя **curl**.

Вам нужно выполнить **curl <container IP>**, указав свой конкретный **IP**-адрес для контейнера.

Теперь, когда мы получили доступ к контейнеру, давайте посмотрим на логи с помощью **Docker**, используя **docker container logs k8s_nginx**, убедитесь, что завершите вкладку.

`docker container logs k8s_nginx`{{execute}}

Теперь **exit** из **SSH**-сессии, мы также будем использовать **kubectl** для чтения логов:

`kubectl logs nginx`{{execute}}

Сообщения одинаковы, **Kubernetes** просто абстрагируется от **Docker**.

## Удалите Pod

А пока давайте очистим окружающую среду **environment**, удалив наш Под.

**kubectl delete**  это команда, которую мы будем использовать для удаления ресурсов.

`kubectl delete pod nginx`{{execute}}

**WARNING**: Будьте осторожны, как только наш **Pod** удален, он исчезнет навсегда.

`watch kubectl get deployments,pods,services`{{execute}}

`watch kubectl get pods,services`{{execute}}

Используйте это ```clear```{{execute interrupt}} чтобы выйти из режима наблюдения или нажмите <kbd>Ctrl</kbd>+<kbd>C</kbd>.
