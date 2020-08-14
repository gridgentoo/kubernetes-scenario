
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

Для работы с YAML в Python используется модуль PyYAML. Он не входит в стандартную библиотеку модулей, поэтому его нужно установить:

`pip install PyYAML`{{execute T1}}

Список пакетов установленых в виртуальное окружение

`pip freeze`{{execute T1}}

Предположим, вам нужен шаблон файла конфигурации, **kuber.j2**:

`vi kuber.j2`{{execute T1}}

```yaml
kubernets {

  limit: {{ quantum_bit.kuber_limit }};

}
```
И у вас есть файл **JSON** с данными, **kuber.json**:

`vi kuber.json`{{execute T1}}

```yaml
{
    "quantum_bit":{

        "kuber_limit": "256"
    }
}
```

Отрендерим его в рабочий файл конфигурации **kuber.yaml** :

`j2 -f json kuber.j2 kuber.json > kuber.yaml`{{execute T1}}


`vi kuber.yaml`{{execute T1}}

```yaml
kubernets {

  limit: 256 ;

}
```

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

#########################################################


### Редактирование ресурсов в Кубернетес.

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

#########################################################

`kubectl get deployment nginx-deployment -o yaml > nginx.yaml`{{execute}}

`vi nginx.yaml`{{execute}}

#########################################################

`kubectl get deployment nginx-deployment -o json > nginx.json`{{execute}}

`vi nginx.json`{{execute}}

#########################################################


Предположим, вам нужен шаблон файла конфигурации, **kuber.j2**:

`vi kuber.j2`{{execute T1}}

```yaml
resources {

  limit: {{ quantum_bit.kuber_limit }};

}
```
И у вас есть файл **JSON** с данными, **kuber.json**:

`vi kuber.json`{{execute T1}}

```yaml
{
    "quantum_bit":{

        "kuber_limit": "256"
    }
}
```

Отрендерим его в рабочий файл конфигурации **kuber.yaml** :

`j2 -f json kuber.j2 kuber.json > kuber.yaml`{{execute T1}}


`vi kuber.yaml`{{execute T1}}

```yaml
resources {

  limit: 256 ;

}
```

############################################################

#########################################################

Отредактируем **nginx.json** добавим в него 

```yaml
                        "resources": {},
                        "limits": "256 М",
                        "requests": "256"
 ```
 
#########################################################

```yaml
{
    "apiVersion": "extensions/v1beta1",
    "kind": "Deployment",
    "metadata": {
        "annotations": {
            "deployment.kubernetes.io/revision": "1"
        },
        "creationTimestamp": "2020-08-13T14:09:28Z",
        "generation": 1,
        "labels": {
            "app": "nginx"
        },
        "name": "nginx-deployment",
        "namespace": "default",
        "resourceVersion": "1779",
        "selfLink": "/apis/extensions/v1beta1/namespaces/default/deployments/nginx-deployment",
        "uid": "99d39ef1-dd6e-11ea-8b9e-0242ac11005a"
    },
    "spec": {
        "progressDeadlineSeconds": 600,
        "replicas": 5,
        "revisionHistoryLimit": 10,
        "selector": {
            "matchLabels": {
                "app": "nginx"
            }
        },
        "strategy": {
            "rollingUpdate": {
                "maxSurge": "25%",
                "maxUnavailable": "25%"
            },
            "type": "RollingUpdate"
        },
        "template": {
            "metadata": {
                "creationTimestamp": null,
                "labels": {
                    "app": "nginx"
                }
            },
            "spec": {
                "containers": [
                    {
                        "image": "nginx:1.8.1",
                        "imagePullPolicy": "IfNotPresent",
                        "name": "nginx",
                        "ports": [
                            {
                                "containerPort": 80,
                                "protocol": "TCP"
                            }
                        ],
                        "resources": {},
                        "limits": "256 М",
                        "requests": "256"
                    }
                ],
                "dnsPolicy": "ClusterFirst",
                "restartPolicy": "Always",
                "schedulerName": "default-scheduler",
                "securityContext": {},
                "terminationGracePeriodSeconds": 30
            }
        }
    },
    "status": {
        "availableReplicas": 5,
        "conditions": [
            {
                "lastTransitionTime": "2020-08-13T14:09:44Z",
                "lastUpdateTime": "2020-08-13T14:09:44Z",
                "message": "Deployment has minimum availability.",
                "reason": "MinimumReplicasAvailable",
                "status": "True",
                "type": "Available"
            },
            {
                "lastTransitionTime": "2020-08-13T14:09:28Z",
                "lastUpdateTime": "2020-08-13T14:09:44Z",
                "message": "ReplicaSet \"nginx-deployment-59988f74c7\" has successfully progressed.",
                "reason": "NewReplicaSetAvailable",
                "status": "True",
                "type": "Progressing"
            }
        ],
        "observedGeneration": 1,
        "readyReplicas": 5,
        "replicas": 5,
        "updatedReplicas": 5
    }
}
```

######################################################

Создадим файл **nginx.j2**
`vi ./resources/resources/nginx.j2`{{execute}}

######################################################

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
        resources:
          limit: {{ quantum_bit.kuber_limit }};
          
```

##############################################################

`j2 -f json nginx.j2 nginx.json > nginx.yaml`{{execute T1}}


Затем создадим простой скрипт-конвертор и сохраним его под именем **json2yaml.py**. 
Этот скрипт импортирует оба модуля — **YAML** и **JSON Python**, а также загружает указанный пользователем файл **JSON**, 
выполняет конвертирование и пишет данные в файл **output.yaml**, в нашем случае выводить будем в **nginx.yaml**.

создадим файл **json2yaml.py**:
`vi json2yaml.py`{{execute T1}}

```yaml
#!/usr/bin/python3
import yaml
import sys
import json

OUT=open('nginx.yaml','w')
IN=open(sys.argv[1], 'r')

JSON = json.load(IN)
IN.close()
yaml.dump(JSON, OUT)
OUT.close()
```

`python3 json2yaml.py nginx.json`{{execute T1}}

После применения скриптов, на **Выходе** получим **nginx.yaml**

`vi nginx.yaml`{{execute T1}}

############################################################

Справка по [kubectl edit](https://kubernetes.io/docs/concepts/cluster-administration/manage-deployment/)


Справка по [kubectl edit](https://jamesdefabia.github.io/docs/user-guide/kubectl/kubectl_edit/)

#########################################################






#########################################################

Существует распространенный инструмент Linux под названием **jq**. **jq** похож на **sed** для данных JSON. 

Использование **jq** может значительно облегчить чтение вывода **JSON** из **kubectl** с подсветкой синтаксиса.

`kubectl get --raw /api/v1/namespaces/default | jq .`{{execute}}

Существует также **Python json.tool**.

`kubectl get -v=9 --raw /api/v1/namespaces/default | python -m json.tool`{{execute}}

`kubectl edit rs vue-rs -o json`{{execute}}

Обратите внимание, что в последней команде мы добавили  [verbosity request](https://kubernetes.io/docs/reference/kubectl/cheatsheet/#kubectl-output-verbosity-and-debugging) `-v=9`. 

Установив уровень 9 (самый высокий), мы получим немного больше информации о том, как команда **kubectl** получает возвращаемую информацию.


#########################################################

We can see that the Deployment scaled up ReplicaSet for the new Pods, and then scaled down the old ReplicaSet. These actions were done one at a time, as specified by our RollingUpdate configuration.

Теперь мы можем получить нашу историю развертывания **Deployment rollout history**:

`kubectl rollout history deployment/nginx-deployment`{{execute}}

Мы можем вернуться к версии:

`kubectl rollout undo deployment.v1.apps/nginx-deployment`{{execute}}



