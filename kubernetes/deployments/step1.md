Прежде чем мы начнем работать с **Deployments**, мы пройдемся по основам **ReplicaSets**. Набор **ReplicaSet** гарантирует, что нужное количество реплик каждого **Pod** запущено и работает. Каждый раз, когда **Pod** выходит из строя **down**, **ReplicaSet** будет развертывать новый, чтобы деплоить высокую доступность **high availability**.

Теперь проинспектируйте файл `cat ./resources/resources/vue-rs.yaml`{{execute}}.

Это должно выглядеть знакомо для ресурса **Pod**. У нас есть несколько дополнений. Эти дополнения позволяют настроить наш **ReplicaSet**.

Самыми большими дополнениями являются **replicas: 3** и **selector**. Первый компонент настраивает общее количество реплик **Pod**, которые должны быть активны всегда. **selector** соответствует набору ограничений для идентификации **Pods** для представления. В этом случае **ReplicaSet** будет отслеживать блоки с меткой **app=vue**.

Мы можем развернуть этот **ReplicaSet** так же, как мы сделали **Pods**:

`kubectl create -f ./resources/resources/vue-rs.yaml`{{execute}}

Теперь посмотрим, как **Kubernetes** создает  **3 vue Pods**  на основе спецификации в файле **vue-rs.yaml**.

`kubectl get po --watch`{{execute}}

Подождите, пока будут созданы Поды. Вы можете нажать `CTRL-C`, чтобы остановить просмотр.

Проинспектируйте `ReplicaSet`.

> ПРИМЕЧАНИЕ: `rs` сокращение от `ReplicaSet`

`kubectl describe rs vue-rs`{{execute interrupt}}

Теперь измените `ReplicaSet`, чтобы создать 5 подов путем изменения значения `replicas: 3`.

`kubectl edit rs vue-rs`{{execute}}

С помощью **edit** вы можете в режиме реального времени **live edit** редактировать конфигурацию ресурса в **Kubernetes**. 
Однако он не будет редактировать основной файл манифеста **Manifest**, представляющий объект.

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

# AutoScaling

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

Note `--dry-run=true`, this means that Kubernetes will not apply the desired state changes to our cluster. However, we provided it with `-o=yaml`, which means output the configuration as YAML. This lets us easily generate a Manifest.

> Обратите внимание на **--dry-run=true**, это означает, что **Kubernetes** не будет применять требуемые изменения состояния к нашему кластеру. 
> Однако мы предоставили ему **-o=yaml**, что означает вывод конфигурации в виде **YAML**. Это позволяет нам легко генерировать манифест **Manifest**.


* Совет:  **-dry-run** с **-o=yaml** - отличный способ создания конфигураций! *

Мы предоставили этот контент в `nano ./resources/resources/hpa-vue.yaml`{{execute}}

Теперь фактически примените конфигурацию:: `kubectl create -f ./resources/resources/hpa-vue.yaml`{{execute}}


На данный момент у нас есть **ReplicaSet**, управляющий **vue Pod**, с настроенным горизонтальным автоматическим масштабированием **Horizontal Pod Autoscaling**. 
Давайте очистим нашу окружающую среду **environment**:

`kubectl delete -f ./resources/resources/hpa-vue.yaml`{{execute}}

`kubectl delete -f ./resources/resources/vue-rs.yaml`{{execute}}
