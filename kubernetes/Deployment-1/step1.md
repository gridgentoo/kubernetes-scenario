Контроллер развертывания **`Deployment controller`** предоставляет возможность декларативного обновления для объектов типа поды **`Pods`** и наборы реплик **`ReplicaSets`**. 

Достаточно описать желаемое состояние [подов/реплик] в объекте **`Deployment`**, после чего контроллер развертывания изменит текущее состояние объектов на желаемое в контролируемом режиме. Стоит отметить, что при манипуляциях с развертываниями **`Deployment`** нам не нужно беспокоиться об управлении наборами реплик **`ReplicaSets`** - все необходимое будет выполнено непосредственно контроллером развертывания.

Как и для всех других API-объектов Kubernetes, для определения **`Deployment`** в yaml-файле нужны поля apiVersion, kind и metadata. Кроме того, в **`Deployment`** также должна присутствовать секция **`.spec`**.

Как мы уже говорили на шаге 1, в секции **`.spec`** обязательно должна присутствовать вложенная секция *`.spec.template`* - шаблон пода (Pod). Он имеет точно такой же формат, как описание пода без секций **apiVersion** и **kind.** Кроме обязательных полей, в секции **`.spec.template`** при описании Deployment нужно указывать соответствующие метки **`.spec.template.metadata.labels`** и политику перезапуска (единственным допустимым значением для **`.spec.template.spec.restartPolicy`** является **Always**, которое соответствует значению по умолчанию).

В поле **`.spec.replicas`** указываем, сколько экземпляров подов должно быть запущено одновременно - если этого не сделать, то будет запущен только один экземпляр пода - .**`spec.replicas`** по умолчанию равно единице.

Можно указать **`.spec.selector`**- это необязательное поле, которое определяет селектор меток для подов, предназначенных для этого развертывания. 
В таком случае, **`.spec.selector`** должен соответствовать значению **`.spec.template.metadata.labels`** или будет отклонен **API Kubernetes**.

В поле **`.spec.strategy`** необходимо определить стратегию обновления старых подов новыми. Допустимые значения для данного поля - **Recreate** или **RollingUpdate** (значение по умолчанию).

Если выбрать стратегию **Recreate** (**`.spec.strategy.type==Recreate`**), то перед стартом новых подов будут удалены все старые.

При стратегии обновления **RollingUpdate** поды будут обновляться плавно, по очереди (дополнительно контролировать этот процесс можно с помощью параметров **maxUnavailable** и **maxSurge**).

Параметр **`.spec.strategy.rollingUpdate.maxUnavailable`** - необязательное поле, указывающее максимальное количество подов, которые могут быть недоступны в процессе обновления. Значение может быть абсолютным числом (например, 5) или процентом от желаемого количества подов (например, 10%). Абсолютное число рассчитывается из процента путем округления. Значение этого параметра не может быть установлено в 0, если **`.spec.strategy.rollingUpdate.maxSurge`** = 0, и по умолчанию равно 25%.

Параметр **`.spec.strategy.rollingUpdate.maxSurge`** - необязательное поле, указывающее максимальное количество подов, которое может быть создано сверх желаемого количества подов (Pods), описанного в развертывании. Значение может быть абсолютным числом (например, 5) или процентом от желаемого количества подов (например, 10%). Значение этого параметра не может быть установлено в 0, если **`.spec.strategy.rollingUpdate.maxUnavailable`** = 0, и по умолчанию равно 25%.

Ниже представлен пример развертывания **`Deployment`**:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
  labels:
    app: nginx
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:1.7.9
        ports:
        - containerPort: 80
```
В этом примере:

 * создается развертывание **`Deployments`** с именем **nginx-deployment** (имя указано в поле **metadata: name**);
 * развертывание создает три экземпляра пода (количество указано в поле **replicas**);
 * в поле селектора указано, как развертывание **`Deployments`** обнаружит, какими подами нужно управлять. 
   В этом примере просто выбираем одну метку, определенную в шаблоне Pod'а (**app: nginx**);
 * описание шаблона Pod'а в поле **template**: spec “требует” запустить docker-контейнер nginx, из образа nginx версии 1.7.9 (образ будет взят с Docker Hub). 
   Данному поду будет присвоена метка **app: nginx**;
 * развертывание открывает 80-й порт контейнера, так что контейнер может отправлять и принимать трафик.


Сохраним данный манифест в файл **`nginx-deployment.yaml`** и запустим его в кластере **Kubernetes** с помощью команды:

`kubectl create -f ./resources/resources/nginx-deployment.yaml --record`{{execute}}

Примечание. Параметр **`--record**` нам весьма пригодится для хранения истории изменений развертывания.

Теперь посмотрим, как **Kubernetes** создает  **`Pods`**  на основе спецификации в файле **`nginx-deployment.yaml`**.

`kubectl get po --watch`{{execute}}

Если сразу же запустить команду **`kubectl get deployments`**, 

`kubectl get deployments`{{execute}}

то вывод **`kubectl get deployments`** всего результат будет следующим:
```
NAME               READY   UP-TO-DATE   AVAILABLE   AGE
nginx-deployment   0/3     3            0           12s
```

Когда вы с помощью данной команды хотите получить состояние развертываний **`Deployments`** в кластере, вам доступны следующие поля:

  * NAME - список имен развертываний в кластере;
  * DESIRED - отображает желаемое количество экземпляров пода (определяется при создании развертывания);
  * CURRENT - отображает количество экземпляров пода в настоящее время;
  * UP-TO-DATE - отображает количество экземпляров пода, которые были обновлены для достижения желаемого состояния;
  * AVAILABLE - отображает количество экземпляров пода, которые доступны пользователям;
  * AGE - отображает время с момента запуска развертывания.

Чтобы увидеть текущий статус (прогресс) развертывания, можно использовать команду **`kubectl rollout status`** 

`kubectl rollout status deployment/nginx-deployment`{{execute}}

Вывод будет примерно таким:

```
Waiting for deployment "nginx-deployment" rollout to finish: 0 of 3 updated replicas are available...
Waiting for deployment "nginx-deployment" rollout to finish: 1 of 3 updated replicas are available...
Waiting for deployment "nginx-deployment" rollout to finish: 2 of 3 updated replicas are available...
deployment "nginx-deployment" successfully rolled out
```

Через несколько секунд (нужно ведь подождать, пока скачается docker-образ) еще раз проверяем состояние развертываний в кластере с помощью **`kubectl get deployments`**:

`kubectl get deployments`{{execute}}

```
NAME               READY   UP-TO-DATE   AVAILABLE   AGE
nginx-deployment   3/3     3            3           3m54s
```
Как видим, данное развертывание создало три экземпляра пода (как мы и писали в желаемом состоянии) - “под капотом” был также создан набор реплик **`ReplicaSet`** - убедиться в этом можно с помощью команды **`kubectl get rs`**:

`kubectl get rs`{{execute}}

Имя набора реплик формируется автоматически и выглядит как [DEPLOYMENT-NAME]-[POD-TEMPLATE-HASH-VALUE], hash-значение генерируется при создании развертывания. Узнать какие метки были автоматически добавлены каждому поду можно командой:

`kubectl get pods --show-labels`{{execute}}

вывод **`kubectl get pods --show-labels`** может выглядеть так:

```
NAME                               READY   STATUS    RESTARTS   AGE    LABELS
nginx-deployment-6dd86d77d-94zql   1/1     Running   0          4m2s   app=nginx,pod-template-hash=6dd86d77d
nginx-deployment-6dd86d77d-9wkjh   1/1     Running   0          4m2s   app=nginx,pod-template-hash=6dd86d77d
nginx-deployment-6dd86d77d-tz4sg   1/1     Running   0          4m2s   app=nginx,pod-template-hash=6dd86d77d
```
Для обновления развертывания (например, изменения версии docker-образа на 1.9.1) можно воспользоваться такой командой:

`kubectl set image deployment/nginx-deployment nginx=nginx:1.9.1`{{execute}}
`deployment "nginx-deployment" image updated`{{execute}}

или изменить сам манифест развертывания (меняем значение **`.spec.template.spec.containers[0].image`**):

`kubectl edit deployment/nginx-deployment`{{execute}}
`deployment "nginx-deployment" edited`{{execute}}

или (предпочтительный вариант) - изменить файл с манифестом развертывания и применить изменения:

`nano nginx-deployment.yaml`{{execute}}

# вносим нужные правки и сохраняем файл

`kubectl apply -f nginx-deployment.yaml`{{execute}}

deployment "nginx-deployment" configured

Как и раньше, наблюдаем за процессом обновления и получаем интересующую нас информацию командами

`kubectl rollout status deployment/nginx-deployment`{{execute}}

`kubectl get deployments`{{execute}}

`kubectl get rs`{{execute}}   (ниже приведен только результат последней команды):

```
NAME                          DESIRED   CURRENT   READY   AGE
nginx-deployment-1564180365   3         3         3       6s
nginx-deployment-2035384211   0         0         0       36s
```

Как видим, новый (ориентируемся по времени) набор реплик (ReplicaSet) находится в желаемом состоянии, 
в то время как в старом наборе количество экземпляров пода равно нулю.

Детальное описание развертывания получаем командой:

`kubectl describe deployments`{{execute}}

```
NAME                          DESIRED   CURRENT   READY   AGE
nginx-deployment-6dd86d77d    0         0         0       4m46s
nginx-deployment-784b7cc96d   3         3         3       101s
master $ kubectl describe deployments
Name:                   nginx-deployment
Namespace:              default
CreationTimestamp:      Mon, 06 Jul 2020 06:48:43 +0000
Labels:                 app=nginx
Annotations:            deployment.kubernetes.io/revision: 2
                        kubernetes.io/change-cause: kubectl create --filename=./resources/resources/nginx-deployment.yaml --record=true
Selector:               app=nginx
Replicas:               3 desired | 3 updated | 3 total | 3 available | 0 unavailable
StrategyType:           RollingUpdate
MinReadySeconds:        0
RollingUpdateStrategy:  25% max unavailable, 25% max surge
Pod Template:
  Labels:  app=nginx
  Containers:
   nginx:
    Image:        nginx:1.9.1
    Port:         80/TCP
    Host Port:    0/TCP
    Environment:  <none>
    Mounts:       <none>
  Volumes:        <none>
Conditions:
  Type           Status  Reason
  ----           ------  ------
  Available      True    MinimumReplicasAvailable
  Progressing    True    NewReplicaSetAvailable
OldReplicaSets:  <none>
NewReplicaSet:   nginx-deployment-784b7cc96d (3/3 replicas created)
Events:
  Type    Reason             Age    From                   Message
  ----    ------             ----   ----                   -------
  Normal  ScalingReplicaSet  4m58s  deployment-controller  Scaled up replica set nginx-deployment-6dd86d77d to 3
  Normal  ScalingReplicaSet  113s   deployment-controller  Scaled up replica set nginx-deployment-784b7cc96d to 1
  Normal  ScalingReplicaSet  87s    deployment-controller  Scaled down replica set nginx-deployment-6dd86d77d to 2
  Normal  ScalingReplicaSet  87s    deployment-controller  Scaled up replica set nginx-deployment-784b7cc96d to 2
  Normal  ScalingReplicaSet  82s    deployment-controller  Scaled down replica set nginx-deployment-6dd86d77d to 1
  Normal  ScalingReplicaSet  82s    deployment-controller  Scaled up replica set nginx-deployment-784b7cc96d to 3
  Normal  ScalingReplicaSet  80s    deployment-controller  Scaled down replica set nginx-deployment-6dd86d77d to 0
```




