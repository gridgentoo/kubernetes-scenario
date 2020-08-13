Теперь, когда мы получили хороший опыт создания наших собственных развертываний **Deployments**, пришло время использовать функции непрерывного обновления **rolling update** и отката **rollback features**.

Во-первых, давайте начнем с полностью настроенного развертывания **Nginx Deployment**, расположенного по адресу **`./resources/nginx.yaml`**

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

Примечание: **kubectl edit** использует vi
Чтобы войти в режим редактирования нажмите **i** 
Чтобы выйти и сохранить изменения из режима редактирования нажмите **Shift+Z** два раза

`kubectl edit deployment nginx-deployment`{{execute}}

С помощью **edit** вы можете в режиме реального времени **live edit** редактировать конфигурацию ресурса в **Kubernetes**. 
Однако он не будет редактировать основной файл манифеста **Manifest**, представляющий объект.

Команда **kubectl edit** позволяет вам напрямую редактировать любой ресурс API, который вы можете получить с помощью инструментов командной строки. Он откроет редактор, определенный вашими переменными среды **KUBE_EDITOR**, или откроется на «vi» для Linux

Файлы для редактирования будут выводиться в версии API по умолчанию или в версии, указанной в **–output-version**. Формат по умолчанию - YAML - если вы хотите отредактировать в JSON, укажите **-o json**.

`kubectl edit deployment nginx-deployment -o json`{{execute}}





Справка по [kubectl edit](https://jamesdefabia.github.io/docs/user-guide/kubectl/kubectl_edit/)

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
