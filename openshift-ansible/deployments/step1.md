
#### Python
В этой среде **environment** вы можете проверить, что Python уже установлен, запустив `python3 --version`{{execute T1}}

Для локальной разработки и запуска кода **Python** рекомендуется использовать виртуальную среду **Python virtual environment**. 
Выполните следующие команды, чтобы создать и активировать виртуальную среду с именем `.venv`.

`apt-get update`{{execute T1}}

`yes | apt-get install python3-venv`{{execute T1}}

`pip install --upgrade pip`{{execute T1}}

Jinja2 - это современный и удобный для разработчиков язык шаблонов для Python, созданный по образцу шаблонов Django. 

`pip install Jinja2`{{execute T1}}

Jinja2 Command-Line Tool, reworked

`pip install j2cli[yaml]`{{execute T1}}

https://github.com/kolypto/j2cli

Для работы с YAML в Python используется модуль PyYAML. Он не входит в стандартную библиотеку модулей, поэтому его нужно установить:

`pip install PyYAML`{{execute T1}}

Список пакетов установленых в виртуальное окружение

`pip freeze`{{execute T1}}

Предположим, вам нужен шаблон файла конфигурации nginx, **nginx.j2**:

`vi nginx.j2`{{execute T1}}

```yaml
server {
  listen 80;
  server_name {{ nginx.hostname }};

  root {{ nginx.webroot }};
  index index.htm;
}
```
И у вас есть файл **JSON** с данными, **nginx.json**:

`vi nginx.json`{{execute T1}}

```yaml
{
    "nginx":{
        "hostname": "localhost",
        "webroot": "/var/www/project"
    }
}
```

Отрендерим его в рабочий файл конфигурации **nginx.conf** :

`j2 -f json nginx.j2 nginx.json > nginx.conf`{{execute T1}}

```yaml
server {
  listen 80;
  server_name localhost;

  root /var/www/project;
  index index.htm;
}
```

`vi nginx.conf`{{execute T1}}


############################################################

Теперь, когда мы получили хороший опыт создания наших собственных развертываний **Deployments**, пришло время использовать функции непрерывного обновления **rolling update** и отката **rollback features**.

Во-первых, давайте начнем с полностью настроенного развертывания **Nginx Deployment**, расположенного по адресу **`./resources/resources/nginx.yaml`**

Для нашего **ReplicaSet** мы можем настроить **`strategy`** , которая определяет, как безопасно выполнять скользящее обновление **rolling update**.

```yaml
strategy:
  rollingUpdate:
    maxSurge: 1
    maxUnavailable: 1
  type: RollingUpdate
```

This strategy utilizes Rolling Updates. With rolling updates, Kubernetes will spin up a new Pod, and when it is ready, tear down an old Pod. The `maxSurge` refers to the total number of Pods that can be active at any given time. If `maxSurge` = 6 and `replicas` = 5, that means 1 new Pod (6 - 5) can be created at a time for the rolling update. `maxUnavailable` is the total number (or percentage) of Pods that can be unavailable at a time.

Here is what our Manifest looks like after integrating this:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
  labels:
    app: nginx
spec:
  replicas: 5
  selector:
    matchLabels:
      app: nginx
  strategy:
    rollingUpdate:
      maxSurge: 1
      maxUnavailable: 1
    type: RollingUpdate
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:1.8.1
        ports:
        - containerPort: 80
```

Теперь применим это изменение конфигурации:: 

`kubectl create -f ./resources/resources/nginx.yaml`{{execute}}


Now that the application is deployed, lets update the Manifest to use a different image: `nginx:alpine`. Now apply the changes.

`kubectl get pods --watch`{{execute}}

We can see that the Pods are being updated one at a time. If we look at the Deployment events, we can see this as well:

`kubectl describe deployment nginx-deployment`{{execute}}

#################################################################################

Редактирование ресурсов 
Вы можете отредактировать API-ресурс в любом редакторе.
`kubectl edit deployment nginx-deployment`{{execute}}

Примечание: **kubectl edit** использует vi
Чтобы войти в режим редактирования нажмите **i** 
Чтобы выйти и сохранить изменения из режима редактирования нажмите **Shift+Z** два раза

С помощью **edit** вы можете в режиме реального времени **live edit** редактировать конфигурацию ресурса в **Kubernetes**. 
Однако он не будет редактировать основной файл манифеста **Manifest**, представляющий объект.

Команда **kubectl edit** позволяет вам напрямую редактировать любой ресурс API, который вы можете получить с помощью инструментов командной строки. Он откроет редактор, определенный вашими переменными среды **KUBE_EDITOR**, или откроется на «vi» для Linux

Файлы для редактирования будут выводиться в версии API по умолчанию или в версии, указанной в **–output-version**. Формат по умолчанию - YAML - если вы хотите отредактировать в JSON, укажите **-o json**.

`kubectl edit deployment nginx-deployment -o json`{{execute}}


#################################################################################

kubectl get deployment nginx-deployment -o yaml > /tmp/nginx.yaml

#################################################################################

`kubectl get deployment nginx-deployment -o yaml > /tmp/nginx.yaml`{{execute}}

`vi /tmp/nginx.yaml`{{execute}}


#################################################################################

`kubectl get deployment nginx-deployment -o json > /tmp/nginx.json`{{execute}}

`vi /tmp/nginx.json`{{execute}}


#################################################################################
Справка по [kubectl edit](https://kubernetes.io/docs/concepts/cluster-administration/manage-deployment/)


Справка по [kubectl edit](https://jamesdefabia.github.io/docs/user-guide/kubectl/kubectl_edit/)

#################################################################################

Существует распространенный инструмент Linux под названием **jq**. **jq** похож на **sed** для данных JSON. 

Использование **jq** может значительно облегчить чтение вывода **JSON** из **kubectl** с подсветкой синтаксиса.

`kubectl get --raw /api/v1/namespaces/default | jq .`{{execute}}

Существует также **Python json.tool**.

`kubectl get -v=9 --raw /api/v1/namespaces/default | python -m json.tool`{{execute}}

`kubectl edit rs vue-rs -o json`{{execute}}

Обратите внимание, что в последней команде мы добавили  [verbosity request](https://kubernetes.io/docs/reference/kubectl/cheatsheet/#kubectl-output-verbosity-and-debugging) `-v=9`. 

Установив уровень 9 (самый высокий), мы получим немного больше информации о том, как команда **kubectl** получает возвращаемую информацию.


###########################################################################################



We can see that the Deployment scaled up ReplicaSet for the new Pods, and then scaled down the old ReplicaSet. These actions were done one at a time, as specified by our RollingUpdate configuration.

We can now get our Deployment rollout history:

`kubectl rollout history deployment/nginx-deployment`{{execute}}

We can jump back a version:

`kubectl rollout undo deployment.v1.apps/nginx-deployment`{{execute}}






######################################################

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

## name: vue-rs

Теперь давайте, проинспектируйте файл `cat ./resources/resources/vue-rs.yaml`{{execute}}.

Посмотрим обьект **`kind: ReplicaSet`**

```yaml
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: vue-rs
  labels:
    app: vue
spec:
  replicas: 3
  selector:
    matchLabels:
      app: vue
  template:
    metadata:
      labels:
        app: vue
    spec:
      containers:
      - name: vue
        image: sylus/vue-hello-world
        ports:
        - containerPort: 80
```

Это должно выглядеть знакомо для ресурса **Pod**. У нас есть несколько дополнений. Эти дополнения позволяют настроить наш **`ReplicaSet`**.

Самыми большими дополнениями являются **replicas: 3** и **selector**. Первый компонент настраивает общее количество реплик **Pod**, которые должны быть активны всегда. **selector** соответствует набору ограничений для идентификации **Pods** для представления. В этом случае **`ReplicaSet`** будет отслеживать блоки с меткой **app=vue**.

Мы можем развернуть этот **`ReplicaSet`** так же, как мы сделали **Pods**:

`kubectl create -f ./resources/resources/vue-rs.yaml`{{execute}}

Теперь посмотрим, как **Kubernetes** создает  **3 vue Pods**  на основе спецификации в файле **vue-rs.yaml**.

`kubectl get po --watch`{{execute}}

Подождите, пока будут созданы Поды. Вы можете нажать `CTRL-C`, чтобы остановить просмотр.

Проинспектируйте **`ReplicaSet`**.

> ПРИМЕЧАНИЕ: `rs` сокращение от **`ReplicaSet`**

`kubectl describe rs vue-rs`{{execute interrupt}}

Теперь измените **`ReplicaSet`**, чтобы создать 5 подов путем изменения значения `replicas: 3`.
Примечание: **kubectl edit** использует vi
Чтобы войти в режим редактирования нажмите **i** 
Чтобы выйти и сохранить изменения из режима редактирования нажмите **Shift+Z** два раза

`kubectl edit rs vue-rs`{{execute}}

С помощью **edit** вы можете в режиме реального времени **live edit** редактировать конфигурацию ресурса в **Kubernetes**. 
Однако он не будет редактировать основной файл манифеста **Manifest**, представляющий объект.

Команда **kubectl edit** позволяет вам напрямую редактировать любой ресурс API, который вы можете получить с помощью инструментов командной строки. Он откроет редактор, определенный вашими переменными среды **KUBE_EDITOR**, или откроется на «vi» для Linux

Файлы для редактирования будут выводиться в версии API по умолчанию или в версии, указанной в **–output-version**. Формат по умолчанию - YAML - если вы хотите отредактировать в JSON, укажите **-o json**.

`kubectl edit rs vue-rs -o json`{{execute}}

Справка по [kubectl edit](https://jamesdefabia.github.io/docs/user-guide/kubectl/kubectl_edit/)

Существует распространенный инструмент Linux под названием **jq**. **jq** похож на **sed** для данных JSON. 

Использование **jq** может значительно облегчить чтение вывода **JSON** из **kubectl** с подсветкой синтаксиса.

`kubectl get --raw /api/v1/namespaces/default | jq .`{{execute}}

Существует также **Python json.tool**.

`kubectl get -v=9 --raw /api/v1/namespaces/default | python -m json.tool`{{execute}}

`kubectl edit rs vue-rs -o json`{{execute}}

Обратите внимание, что в последней команде мы добавили  [verbosity request](https://kubernetes.io/docs/reference/kubectl/cheatsheet/#kubectl-output-verbosity-and-debugging) `-v=9`. 

Установив уровень 9 (самый высокий), мы получим немного больше информации о том, как команда **kubectl** получает возвращаемую информацию.


###########################################################

# Scaling

На последнем шаге мы увеличиваете Реплику `vue-rs` до 5 подов, редактируя файл спецификации **spec file**. Эти изменения были применены автоматически.

# Manual Scaling

Чтобы вручную масштабировать **ReplicaSet** вверх или вниз, используйте команду **`scale`**. Уменьшите число **vue** подов, до 2 с помощью команды:

`kubectl scale rs vue-rs --replicas=2`{{execute}}

Вы можете проверить, что 3 из 5 экземпляров **vue** были завершены **terminated**:

`kubectl get pods`{{execute}}

или наблюдать их, пока они не закончатся

`kubectl get po --watch`{{execute}}

Конечно, идеальный способ сделать это - обновить наш манифест **Manifest**, чтобы отразить эти изменения.

## AutoScaling

**Kubernetes** обеспечивает автоматическое масштабирование ваших подов. Однако, **kube-scheduler** может быть не в состоянии запланировать дополнительные Поды, если ваш кластер находится под высокой нагрузкой. 

Кроме того, если у вас ограниченный набор вычислительных ресурсов **limited set**, автоматическое масштабирование подов **autoscaling Pods** может иметь серьезные последствия, если только ваши **worker nodes** не могут автоматически масштабироваться как (например, группы автоматического масштабирования **AWS**).

```yaml
apiVersion: autoscaling/v1
kind: HorizontalPodAutoscaler
metadata:
  name: frontend-scaler
spec:
  scaleTargetRef:
    kind: ReplicaSet
    name: vue-rs
  minReplicas: 3
  maxReplicas: 10
  targetCPUUtilizationPercentage: 50
```

Чтобы увидеть все параметры **autoscale**:

`kubectl autoscale --help`{{execute interrupt}}

Также возможно автоматически генерировать файл конфигурации **config file**, который мы видели ранее. 
Команда для вывода **output a YAML config** выглядит следующим образом:

`kubectl autoscale rs vue-rs --max=10 --min=3 --cpu-percent=50 --dry-run=true -o=yaml`{{execute}}


> Обратите внимание на **--dry-run=true**, это означает, что **Kubernetes** не будет применять требуемые изменения состояния к нашему кластеру. 
> Однако мы предоставили ему **-o=yaml**, что означает вывод конфигурации в виде **YAML**. Это позволяет нам легко генерировать манифест **Manifest**.


* Совет:  **-dry-run** с **-o=yaml** - отличный способ создания конфигураций! *

Мы предоставили этот контент в `nano ./resources/resources/hpa-vue.yaml`{{execute}}

Теперь фактически примените конфигурацию:: `kubectl create -f ./resources/resources/hpa-vue.yaml`{{execute}}


На данный момент у нас есть **`ReplicaSet`**, управляющий **vue Pod**, с настроенным горизонтальным автоматическим масштабированием **Horizontal Pod Autoscaling**. 
Давайте очистим нашу окружающую среду **environment**:

`kubectl delete -f ./resources/resources/hpa-vue.yaml`{{execute}}

`kubectl delete -f ./resources/resources/vue-rs.yaml`{{execute}}
