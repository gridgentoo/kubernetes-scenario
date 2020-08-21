######################################################

Создадим файл **nginx.json**

`vi nginx.json`{{execute}}

######################################################

И у вас есть файл JSON с данными, nginx.json:

```yaml
{
    "quantum_bit":{

        "kuber_limit": "256"
    }
}
```
######################################################


Создадим файл **nginx.j2**

`vi nginx.j2`{{execute}}

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

**Linux (shell pipe**) для **j2cli** 

**j2cli** - интерфес командной строки CLI  для шаблонов **Template Jinja2**

`j2 -f json nginx.j2 nginx.json > nginx.yaml`{{execute T1}}

`vi nginx.yaml`{{execute T1}}

##############################################################

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

#########################################################

Существует распространенный инструмент Linux под названием **jq**. **jq** похож на **sed** для данных JSON. 

Использование **jq** может значительно облегчить чтение вывода **JSON** из **kubectl** с подсветкой синтаксиса.

`kubectl get --raw /api/v1/namespaces/default | jq .`{{execute}}

Существует также **Python json.tool**.

`kubectl get -v=9 --raw /api/v1/namespaces/default | python -m json.tool`{{execute}}

`kubectl edit rs vue-rs -o json`{{execute}}

Обратите внимание, что в последней команде мы добавили  [verbosity request](https://kubernetes.io/docs/reference/kubectl/cheatsheet/#kubectl-output-verbosity-and-debugging) `-v=9`. 

Установив уровень 9 (самый высокий), мы получим немного больше информации о том, как команда **kubectl** получает возвращаемую информацию.

############################################################

Справка по [kubectl edit](https://kubernetes.io/docs/concepts/cluster-administration/manage-deployment/)


Справка по [kubectl edit](https://jamesdefabia.github.io/docs/user-guide/kubectl/kubectl_edit/)

#########################################################


