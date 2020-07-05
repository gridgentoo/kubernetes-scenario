Прежде чем мы начнем работать с **Deployments**, мы пройдемся по основам **ReplicaSets**. Набор **ReplicaSet** гарантирует, что нужное количество реплик каждого **Pod** запущено и работает. Каждый раз, когда **Pod** выходит из строя **down**, **ReplicaSet** будет развертывать новый, чтобы деплоить высокую доступность **high availability**.

**ReplicaSet** гарантирует, что определенное количество экземпляров подов (Pods) будет запущено в кластере **Kubernetes** в любой момент времени. 

Сразу стоит сказать, что деплоймент (**`Deployment`**), который мы рассмотрим далее на 3 шаге сценария, представляет собой абстракцию более высокого уровня, которая управляет **`ReplicaSet`** и предоставляет расширенный функционал управления контейнерами. Разработчики **Kubernetes** советуют использовать именно **`Deployments`**, если не нужна специфическая настройка оркестрации (или если вообще не требуется обновление подов). При использовании **`Deployments`**, вам не нужно беспокоиться об управлении создаваемыми **`ReplicaSet`** - деплоймент все сделает за вас.

Фактически это значит, что вам (возможно) и не придется манипулировать объектами **`ReplicaSet`**: достаточно будет деплоймента с описанием свойств приложения в разделе **spec**.

**`ReplicaSet`** - это следующее поколение **Replication Controller**. Единственная разница между **`ReplicaSet`** и **`Replication Controller`** - это поддержка селектора.

**`ReplicaSet`** поддерживает множественный выбор в селекторе, тогда как **Replication Controller** поддерживает в селекторе только выбор на основе равенства.

Различия между Replication Controller, **`ReplicaSet`** и **`Deployment`** рассмотрены в отдельной статье.

Как и для всех других API-объектов Kubernetes, для определения **`ReplicaSet`** в yaml-файле нужны поля apiVersion, kind и metadata. Кроме того, в **`ReplicaSet`** также должна присутствовать секция .spec.

Далее, в секции .spec обязательно должна присутствовать вложенная секция **`.spec.template`** - шаблон пода (Pod). Он имеет точно такой же формат, как описание пода (Pod) без секций apiVersion и kind. Кроме обязательных полей, в секции **`.spec.template при описании`**, **`ReplicaSet`** нужно указывать соответствующие метки (**`.spec.template.metadata.labels`**) и политику перезапуска (единственным допустимым значением для **`.spec.template.spec.restartPolicy`** является **Always**, которое соответствует значению по умолчанию).

Секция `**.spec.selector`** описывает селектор меток.

**`ReplicaSet`** управляет всеми подами (Pods) с метками, которые соответствуют описанному селектору - неважно, создавались ли эти поды самим **`ReplicaSet`**, другим процессом (например, деплойментом) или администратором вручную. Такой подход позволяет изменять **`ReplicaSet`**, не затрагивая запущенные поды в кластере.

При описании **`ReplicaSet`** стоит указать, сколько экземпляров подов должно работать одновременно (а иначе какой смысл в использовании **`ReplicaSet`**), установив параметр **`.spec.replicas`**. Если этого не сделать, то будет запущен только один экземпляр пода - **`.spec.replicas`** по умолчанию равно единице.

**`ReplicaSet`** может сам иметь метки - они должны быть установлены в разделе **`.metadata.labels`**. Как правило, их нужно устанавливать по аналогии с установкой меток в секции **`.spec.template.metadata.labels`**, но сами метки могут быть разными, потому что **`.metadata.labels`** не влияют на поведение **`ReplicaSet`**.

Пример описания **`ReplicaSet`**:

```yaml
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: frontend
  labels:
    app: guestbook
    tier: frontend
spec:
  replicas: 3
  selector:
    matchLabels:
      tier: frontend
    matchExpressions:
      - {key: tier, operator: In, values: [frontend]}
  template:
    metadata:
      labels:
        app: guestbook
        tier: frontend
    spec:
      containers:
      - name: php-redis
        image: gcr.io/google_samples/gb-frontend:v3
        resources:
          requests:
            cpu: 100m
            memory: 100Mi
        env:
        - name: GET_HOSTS_FROM
          value: env
        ports:
        - containerPort: 80
```


Предложенный манифест можно сохранить в файл **`frontend.yaml`**:

Создадим файл `nano ./resources/resources/frontend.yaml`{{execute}}.

Запустим манифест в кластере **Kubernetes** с помощью утилиты командной строки:

`kubectl create -f ./resources/resources/frontend.yaml`{{execute}}

Теперь посмотрим, как **Kubernetes** создает  **Pods**  на основе спецификации в файле **`frontend.yaml`**.

`kubectl get po --watch`{{execute}}

Просмотреть детальное состояние запущенного выше **`ReplicaSet`** можно с помощью команды **`kubectl describe rs/frontend`**:

`kubectl describe rs/frontend`{{execute}}

Pезультат выполнения команды **`kubectl describe rs/frontend`** будет примерно следующим: 

```yaml
Name:         frontend
Namespace:    default
Selector:     tier=frontend,tier in (frontend)
Labels:       app=guestbook
              tier=frontend
Annotations:  <none>
Replicas:     3 current / 3 desired
Pods Status:  3 Running / 0 Waiting / 0 Succeeded / 0 Failed
Pod Template:
  Labels:  app=guestbook
           tier=frontend
  Containers:
   php-redis:
    Image:      gcr.io/google_samples/gb-frontend:v3
    Port:       80/TCP
    Host Port:  0/TCP
    Requests:
      cpu:     100m
      memory:  100Mi
    Environment:
      GET_HOSTS_FROM:  env
    Mounts:            <none>
  Volumes:             <none>
Events:
  Type    Reason            Age   From                   Message
  ----    ------            ----  ----                   -------
  Normal  SuccessfulCreate  94s   replicaset-controller  Created pod: frontend-z6s75
  Normal  SuccessfulCreate  94s   replicaset-controller  Created pod: frontend-db94c
  Normal  SuccessfulCreate  94s   replicaset-controller  Created pod: frontend-9v28p
```





## AutoScaling

**`ReplicaSet`** можно легко масштабировать (вверх или вниз), просто меняя значение поля **`.spec.replicas`**.

Стоит отметить, что наборы **`ReplicaSet`** могут использоваться для горизонтального масштабирования подов (автоскейлинга, **HPA**). Пример настройки такого масштабирования (в зависимости от использования **CPU**) для созданного ранее **`ReplicaSet`** будет выглядеть так:

```yaml
apiVersion: autoscaling/v1
kind: HorizontalPodAutoscaler
metadata:
  name: frontend-scaler
spec:
  scaleTargetRef:
    kind: ReplicaSet
    name: frontend
  minReplicas: 3
  maxReplicas: 10
  targetCPUUtilizationPercentage: 50
```

`nano ./resources/resources/hpa-rs.yaml`{{execute}}

Сохраняем предложенный манифест в файл **`hpa-rs.yaml`** и запускаем его в кластере **Kubernetes**:

`kubectl create -f ./resources/resources/hpa-rs.yaml`{{execute}}

Теперь посмотрим, как **Kubernetes** создает  **Pods**  на основе спецификации в файле **`hpa-rs.yaml`**.

`kubectl get po --watch`{{execute}}

Для удаления **`ReplicaSet`** и всех его подов, нужно использовать команду **kubectl delete** .... При этом утилита **kubectl** выполнит масштабирование количества реплик до нуля, дождется удаления каждого пода и удалит сам **`ReplicaSet`**. При использовании **REST API** все три шага нужно выполнять отдельно и в правильной очередности.

Есть возможность удалить **`ReplicaSet`** не затрагивая ни один из его подов, для этого следует использовать **kubectl delete** с дополнительным параметром **--cascade=false**.

`kubectl delete -f ./resources/resources/frontend.yaml`{{execute}}

`kubectl delete -f ./resources/resources/hpa-rs.yaml`{{execute}}

Поды (**Pods**) могут быть удалены из набора **`ReplicaSet`** путем изменения их меток - этот вариант может пригодиться при отладке, восстановлении данных и т. д. Поды, которые удаляются таким образом, будут автоматически заменены (при условии, что количество реплик в наборе **`ReplicaSet`** также не изменяется).
