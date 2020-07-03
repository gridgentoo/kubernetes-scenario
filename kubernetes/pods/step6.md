# Shared Volumes

В **Kubernetes** вы можете использовать общий том **shared Kubernetes Volume** в качестве простого и эффективного способа обмена данными между контейнерами в **Pod**. 
В большинстве случаев достаточно использовать директорию на хосте, который является общим для всех контейнеров в **Pod**. Это означает, что на хосте будет директория, смонтированная в контейнерах **mounted into containers** в **single Pod**. Если **Pod** выйдет из строя, все данные в этом **shared volume** будут потеряны.

**Kubernetes Volumes** позволяют данным пережить перезапуск контейнера, но эти тома имеют то же время жизни **lifetime**, что и **Pod**. 
Это означает, что **volume**  (и данные, которые он содержит) существует ровно столько, сколько существует этот **Pod**. 
Если этот **Pod** удаляется по какой-либо причине, даже если создается идентичная замена, общий том  **shared Volume**, также уничтожается и создается заново.

Стандартный вариант использования для **multi-container Pod** с общим томом **shared Volume** - это когда один контейнер записывает логи или другие файлы в общий каталог, а другой контейнер читает из общей директории **shared directory**.

Изучите файл `nano ./resources/resources/pod-volume.yaml`{{execute}} в проводнике.

Первый контейнер запускает сервер **Nginx**. Контейнер монтирует общий том **shared volume** в директорию **/usr/share/nginx/html**.

Второй контейнер использует **Debian image** и монтирует общий том **shared volume** в директорию контейнера **/html**.

Каждую секунду второй контейнер добавляет текущую дату и время в файл **index.html**, который находится в общем томе **shared volume**. 
Когда пользователь делает **HTTP**-запрос к **Pod**, сервер **Nginx** читает этот файл и передает его обратно пользователю в ответ на запрос.

`kubectl create -f ./resources/resources/pod-volume.yaml`{{execute}}

Давайте посмотрим наши Pods:

`kubectl get pods`{{execute}}

И давайте **describe the Pod**:

`kubectl describe pod shared-volume`{{execute}}

Мы можем проверить, что оба контейнера могут **see** один и тот же файл:

`kubectl exec shared-volume -c nginx -- /bin/cat /usr/share/nginx/html/index.html`{{execute}}

`kubectl exec shared-volume -c debian -- /bin/cat /html/index.html`{{execute}}

Удалите **pod resources**, когда закончите:

`kubectl delete -f ./resources/pod-volume.yaml`{{execute}}
