**Red Hat AMQ Streams** упрощает процесс запуска **Apache Kafka** в кластере **OpenShift**. 
В этом руководстве представлены инструкции по развертыванию рабочей среды **AMQ Streams**.

### Вход в кластер через **OpenShift CLI**

Перед созданием любых приложений войдите в систему как **admin**. 
Это потребуется, если вы хотите войти в веб-консоль и использовать ее.

Кликните [Web Console](https://console-openshift-console-[[HOST_SUBDOMAIN]]-443-[[KATACODA_HOST]].environments.katacoda.com) tab чтобы открыть **dashboard OpenShift 4.6**.

Чтобы войти в кластер OpenShift из **_Terminal_**, выполните:

``oc login -u admin -p admin``{{execute}}

Это позволит вам войти в систему, используя учетные данные **credentials**:

* **Username:** ``admin``
* **Password:** ``admin``

Используйте те же учетные данные **credentials** для входа в веб-консоль **web console**.

### Создание собственного пространства имен **namespace**

Чтобы создать новое (проектное) пространство имен под названием ``kafka`` для **AMQ Streams Kafka Cluster Operator**, выполните команду:

``oc new-project kafka``{{execute}}

### Инсталлируйте **AMQ streams operator**

***AMQ Streams*** предоставляет образы контейнеров и операторов для запуска **Kafka** в **OpenShift**. **AMQ Streams Operators** имеют основополагающее значение для работы **AMQ Streams**. Операторы, предоставляемые с **AMQ Streams**, специально созданы со специальными эксплуатационными знаниями **operational knowledge** для эффективного управления **Kafka**.

Разверните группу операторов и подписку **Operator Lifecycle Manager**, чтобы легко установить оператора в ранее созданном пространстве имен:

``oc -n kafka apply -f /opt/operator-install.yaml``{{execute}}

Вы должны увидеть следующий результат:

```bash
operatorgroup.operators.coreos.com/streams-operatorgroup created
subscription.operators.coreos.com/amq-streams created
```

> Вы также можете развернуть оператор потоков **AMQ streams operator** из **OpenShift OperatorHub** из административной **web-console**.

### Проверить развертывание оператора

Следите за развертыванием оператора **operator deployment**, чтобы убедиться, что он работает.

Чтобы посмотреть статус подов, выполните следующую команду:

``oc -n kafka get pods -w``{{execute}}

Вы увидите, как статус оператора меняется, пока он не перейдет в режим **`running`**. Он должен выглядеть примерно так:

```bash
NAME                                                   READY   STATUS              RESTARTS   AGE
amq-streams-cluster-operator-v1.5.3-59666d98cb-8ptlz   0/1     ContainerCreating   0          10s
amq-streams-cluster-operator-v1.5.3-59666d98cb-8ptlz   0/1     Running             0          18s
amq-streams-cluster-operator-v1.5.3-59666d98cb-8ptlz   1/1     Running             0          34s
```

Нажмите <kbd>Ctrl</kbd>+<kbd>C</kbd>  чтобы остановить процесс.

`^C`{{execute ctrl-seq}}
