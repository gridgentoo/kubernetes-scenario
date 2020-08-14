
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

#################################################

**Kubernetes Deployments** можно создать в командной строке с помощью [`**kubectl run**`](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#run).
Это позволяет вам настроить как **Pods**, так и **ReplicaSets**.

```yaml
kubectl run NAME --image=image
   --port=port]
  [--env="key=value"]
  [--replicas=replicas]
  [--dry-run=bool]
  [--overrides=inline-json]
  [--command]
  -- [COMMAND] [args...]
```

Чтобы создать простое **Kubernetes deployment** из командной строки:

`kubectl run vue --image=sylus/vue-hello-world --port 80`{{execute}}

Поздравляю, вы только что создали свое первое **Deployment**. Команда **run** создала **Deployment**, которая автоматически выполнила несколько вещей для вас:

* Создал **ReplicaSet**, который создал Под
* **scheduler** искал подходящий ноду для запуска Пода и запланировал запуск Пода на этой Нода.
* Сконфигурировал кластер для ***restart / reschedule*** Пода при необходимости

По сути, он создал все **objects**, которые мы определили, включая **Pod** и **ReplicaSets**. Он запланировал Подв на ноде, способном принимать рабочие нагрузки **workloads**.

Чтобы убедиться, что команда создала **Deployment**:

`kubectl get deployments`{{execute}}

Чтобы увидеть Поды, созданные при **Deployment**:

`kubectl get pods`{{execute}}

Чтобы увидеть набор **ReplicaSet**, созданный при **Deployment**:

`kubectl get replicasets`{{execute}}

Мы также можем получить больше информации о нашем **Deployment**:

`kubectl describe deployment vue`{{execute}}

#### The magic of Deployments

Если Под, созданный при **Deployment**, когда-либо потерпит крах, он автоматически перезапустит его. Чтобы увидеть это в действии, убейте Pod напрямую:

`kubectl delete pod $(kubectl get pods --no-headers=true  | awk '{print $1;}')`{{execute}}

Под должен быть успешно удален. Теперь подождите минуту или две и снова проверьте Под:

`kubectl get pods`{{execute}}

Обратите внимание, что Под снова работает. Это связано с тем, что **Deployment** перезапустит Под в случае сбоя. Что на самом деле перезапускает эти Поды?

Давайте быстро очистим и удалим наш **Deployment**:  

`kubectl delete deployment vue`{{execute}}
