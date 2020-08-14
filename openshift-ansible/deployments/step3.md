############################################################

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

#############################################

Наиболее эффективный и повторяемый **repeatable** способ управления нашими развертываниями **`Deployments`** - это файлы **Manifest**. 
Вот то, что определяет наше простое приложение vue (**`./resources/resources/vue-simple.yaml`**):

Посмотрим обьект **`kind: Deployment`**

`cat resources/resources/vue-simple.yaml`{{execute}}

```yaml
kind: Deployment
metadata:
  name: vue-deployment
spec:
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

Если мы посмотрим на это развертывание **Deployments**, оно будет очень похоже на наши манифесты **PodSpec** и **ReplicaSet**. 
Мы можем добавить любую конфигурацию, которую мы уже рассмотрели в разделе **Pod**, к этому манифесту. 
Мы также должны настроить **ReplicaSet** в соответствии с нашими требованиями к репликации.

Давайте создадим наше развертывание **Deployment**: `kubectl create -f ./resources/resources/vue-simple.yaml`{{execute}}

Все файлы **deployment YAML** для развертывания Kubernetes должны содержать следующие спецификации:

#### **apiVersion** - `apps/v1`

 **`apiVersion`** specifies указывает версию API для использования. 
 Объекты **API** определены в **groups**. Объект **`deployment`**  принадлежит к группе **`apps`** **API group**. 
 Групповые объекты могут быть объявлены как **`alpha`**, **`beta`**, or **`stable`**:
   * **`alpha`** - может содержать ошибки и не гарантирует, что это будет работать в будущем. Пример: **`(object)/v1alpha1`**
   * **`beta`** - все еще несколько нестабильно, но, скорее всего, войдет в основные **API**-интерфейсы **Kubernetes**. Пример: **`(object)/v1beta1`**
   * **`stable`** - в производственных системах рекомендуется использовать только стабильные версии. Пример: **`apps/v1`**

NOTE: Вы можете проверить последнюю версию **API Kubernetes** здесь:  https://kubernetes.io/docs/reference/

#### **kind** - `Deployment`

Значение **`kind`** объявляет тип объекта **Kubernetes**, который будет описан в файле **Yaml**. 

**Kubernetes** поддерживает следующие **`kind`**  objects:
  1. `componentstatuses`
  1. `configmaps`
  1. `daemonsets`
  1. `Deployment`
  1. `events`
  1. `endpoints`
  1. `horizontalpodautoscalers`
  1. `ingress`
  1. `jobs`
  1. `limitranges`
  1. `Namespace`
  1. `nodes`
  1. `pods`
  1. `persistentvolumes`
  1. `persistentvolumeclaims`
  1. `resourcequotas`
  1. `replicasets`
  1. `replicationcontrollers`
  1. `serviceaccounts`
  1. `services`

#### **`metadata`**

 **`metadata`** объявляют дополнительные данные для уникальной идентификации объекта **Kubernetes**. 
 **key metadata**, которые можно добавить к объекту:
  * **`labels`** - size [constrained](https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/#syntax-and-character-set) пары **key-value**, используемые внутри **k8s** для выбора объектов на основе **identifying information**
  * **`name`** - название объекта (в данном случае название развертывания **deployment**)
  * **`namespace`** - имя **namespace** для создания объекта (**deployment**)
  * **`annotations`** - большие неструктурированные пары **key-value**, используемые для предоставления *non-identifying* информации для объектов. 
  * **`spec`** - желаемое состояние и характеристики объекта. `spec` имеет три важных подполя:
    - **`replicas`**: количество Подов для запуска в развертывании **deployment**
    - **`selector`**: **pod labels**, которые должны соответствовать для управления развертыванием **deployment**
    - **`template`**: определяет каждый Под (контейнеры, порты и т. д.)
