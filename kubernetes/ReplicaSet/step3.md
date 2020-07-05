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

Теперь посмотрим, как **Kubernetes** создает  **`Pods`**  на основе спецификации в файле **`nginx-deployment.yaml`**.

`kubectl get po --watch`{{execute}}

########################################################

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
