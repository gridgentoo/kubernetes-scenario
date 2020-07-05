Наиболее эффективный и повторяемый **repeatable** способ управления нашими развертываниями **Deployments** - это файлы **Manifest**. 
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
