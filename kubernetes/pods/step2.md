
Выдача команд непосредственно из командной строки отлично подходит для быстрой проверки **inspection**, но для **production systems** повторяемость очень важна. 
Для обеспечения повторяемости используются файлы спецификации объектов **Kubernetes**. Мы обычно называем эти файлы **PodSpec** или **Manifest**.

Как и все объекты **Kubernetes**, Поды могут быть описаны с использованием синтаксиса **YAML** или **JSON**. 
**Kubernetes** предоставляет более простое использование **YAML** для описания объектов, но использует формат **JSON** для всех объектов.

> **Помните, YAML чрезвычайно чувствителен к spacing**

Вот пример простого модуля NGINX в обоих форматах:

#### JSON

```json
{
    "kind": "Pod",
    "apiVersion": "v1",
    "metadata":{
        "name": "nginx",
        "labels": {
            "name": "nginx"
        }
    },
    "spec": {
        "containers": [{
            "name": "nginx",
            "image": "nginx",
            "ports": [{"containerPort": 80}]
        }]
    }
}
```

#### YAML

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx
  labels:
    name: nginx
spec:
  containers:
  - name: nginx
    image: nginx
    ports:
    - containerPort: 80
```

Просмотр **PodSpec** как **YAML**, как правило, легче **read/understand**. В этом случае мы можем увидеть несколько вещей, которые конфигуриет наш PodSpec:

- **apiVersion**: the API version of the object, `v1` means production ready. There is also `alpha` and `beta`.
- **kind**: определяет тип объекта **type of object**
- **metadata**: предоставляет метаданные для **object**
- **spec**: спецификация, определяющая контейнеры в Pod


## Посмотреть спецификацию Pod 

Чтобы просмотреть спецификацию файла для работающего модуля **pod**, используйте следующие **command(s):**

**NOTE**: Если запущенных **pods** нет, запустите их из **command line**: 

`kubectl run nginx --image=nginx --port=80 --restart=Never`{{execute}}

Чтобы увидеть **YAML output**:

`kubectl get pod nginx --output=yaml`{{execute}} or `kubectl get pods/nginx -o yaml`{{execute}}

Чтобы увидеть *JSON output*:

`kubectl get pod nginx --output=json`{{execute}} or `kubectl get pods/nginx -o json`{{execute}}

**Output reflects** отражает точные аргументы, которые использовались для запуска **Pod**, а также некоторую дополнительную информацию. Этот вывод можно использовать для создания файла спецификации.

Если вы стартовали новый Pod, удалите под с помощью:

`kubectl delete pod nginx`{{execute}}.

## Создайте файл спецификации Pod 

Откройте **resources/resources/vue-complete.yaml** в редакторе. Он определяет под с именем **vue**, с одним контейнером.
`nano ./resources/resources/vue-complete.yaml`{{execute}}

Теперь, когда у нас есть **PodSpec**, давайте создадим **Pod** из него:

`kubectl apply -f ./resources/resources/vue-complete.yaml`{{execute}}

**Verify** убедитесь, что новый модуль **Vue.js** запущен:

`kubectl get pods`{{execute}}

Мы также можем осмотреть **Pod**:

`kubectl describe pod vue`{{execute}}

## Сконфигурируем Pods

Конечно, это не все, что мы можем сделать с файлом **PodSpec**, мы можем многое настроить.

Открыв в вашем редакторе **resources/resources/vue-complete.yaml**, добавим команду по умолчанию. 
Добавьте запись **command** под **image**:

`command: ['sh', '-c', 'echo $(env) && sleep 3600']`

What we'll do is add this to our PodSpec file. Now it should look like this:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: vue
  labels:
    app: vue
spec:
  containers:
  - name: vue
    image: vue/hello-world
    command: ['sh', '-c', 'echo $(env) && sleep 3600']
    ports:
    - containerPort: 80
```

Мы можем запустить `kubectl apply -f ./resources/resources/vue-complete.yaml`{{execute}}, чтобы обновить этот Под. 

Поскольку некоторые поля не могут быть изменены после создания модуля, вам необходимо сначала удалить модуль (`kubectl delete -f ./resources/resources/vue-complete.yaml`). Это не будет проблемой после того, как мы узнаем о **deployments**.

Next, we'll configure environment variables. In Kubernetes, you do this with `env`, specifically:
Далее мы настроим переменные среды **environment variable**. В **Kubernetes** вы делаете это с **env**, specifically:

```yaml
env:
  name: username
  value: admin
```

Давайте установим две переменные окружения **environment variable** в нашем **PodSpec**:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: vue
  labels:
    app: vue
spec:
  containers:
  - name: vue
    image: vue/hello-world
    ports:
    - containerPort: 80
    command: ['sh', '-c', 'echo $(env) && sleep 3600']
    env:
    - name: username
      value: admin
    - name: password
      value: password
```

Теперь, если бы мы обновили **Pod**, он бы вывел переменные окружения, включая **including** наши две новые.

Далее мы настроим локальное монтирование тома **local volume mount**. В **Kubernetes** вы определяете **volume** в спецификации **Pod**, но вне списка **containers list**. Внутри списка контейнеров вы определяете **volumeMount**, который запрашивает хранилище у тома **volume**.

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: vue
  labels:
    app: vue
spec:
  containers:
  - name: vue
    image: vue/hello-world
    ports:
    - containerPort: 80
    command: ['sh', '-c', 'echo $(env) && sleep 3600']
    env:
    - name: username
      value: admin
    - name: password
      value: password
    volumeMounts:
      - name: my-volume
        mountPath: /data

  volumes:
  - name: my-volume
    emptyDir: {}
```

Теперь, когда мы запустим этот **Pod**, у нас будет том **volume** внутри **Pod**, примонтированный к **/data**  внутри контейнера **vue**.

**Pods** также могут иметь определенный лимит ресурсов. Мы делаем это с помощью **resources**:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: vue
  labels:
    app: vue
spec:
  containers:
  - name: vue
    image: vue/hello-world
    ports:
    - containerPort: 80
    command: ['sh', '-c', 'echo $(env) && sleep 3600']
    env:
    - name: username
      value: admin
    - name: password
      value: password
    volumeMounts:
      - name: my-volume
        mountPath: /data
    resources:
      limits:
        memory: "128Mi"
        cpu: "0.5"

  volumes:
  - name: my-volume
    emptyDir: {}
```

Это наложит **limit** на использование нашим Подом, только 50% одного ядра процессора **CPU core** и не более **128 Megabytes** оперативной памяти. 
Если он попытается использовать больше, Kubernetes прекратит работу **terminate** Пода.
