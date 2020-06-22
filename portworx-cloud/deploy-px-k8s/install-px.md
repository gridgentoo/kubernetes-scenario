**PX on Kubernetes**** можно задеплоить с помощью одной команды такой как **DaemonSet**. [DaemonSet](https://kubernetes.io/docs/concepts/workloads/controllers/daemonset/).

### Шаг: Получим **Fetch** спецификацию **Portworx**

`kubectl version --short`{{execute}}

VER=`kubectl version --short | awk -Fv '/Server Version: /{print $3}`

`curl -L -s -o px-spec.yaml "https://install.portworx.com/2.3?mc=false&kbver=${VER}&b=true&s=%2Fdev%2Fvdb&c=px-demo&stork=true&st=k8s" `{{execute T1}}

Посмотрите, как мы использовали  [query parameters](https://docs.portworx.com/scheduler/kubernetes/install.html#generating-the-spec) в команде curl для настройки нашей спецификации.

In our comamnd:
- `c=px-demo` указывает имя кластера **cluster name**
- `b=true` указывает на использование внутреннего **etcd**
- `kbVer=${VER}` указывает версию **Kubernetes**
- `s=/dev/vdb` определяет блочное устройство **block device** для использования

### Шаг: применить спецификацию **Portworx**

`kubectl apply -f px-spec.yaml`{{execute T1}}

### Шаг: подождите, пока **Portworx pod ** не будут готовы

`watch kubectl get pods -n kube-system -l name=portworx -o wide`{{execute T1}}

> Note: **Portworx** может занять несколько минут для завершения инициализации **initialization**

Когда все **nodes** ,будут в статусе `Ready 1/1` кликните ```clear```{{execute interrupt}}

### Шаг: Получить статус кластера **Portworx**

**Portworx ** поставляется с командной строкой `**pxctl**`, которую вы можете использовать для управления **Portworx**.

Команда ниже выполняет команду **pxctl status**, используя **kubectl** в одном из **Portworx pods**, чтобы получить общее состояние кластера **cluster status**.

Сначала настройте переменную окружения `**PX_POD**`.

`PX_POD=$(kubectl get pods -l name=portworx -n kube-system -o jsonpath='{.items[0].metadata.name}')`{{execute}}

Затем используйте `**kubectl**` для выполнения `**pxctl status**` в кластере.

`kubectl exec -it $PX_POD -n kube-system -- /opt/pwx/bin/pxctl status`{{execute T1}}

Теперь у нас есть **3-node Portworx cluster**!

Давайте погрузимся в наш **cluster status**.
- Все **3 nodes** подключены к сети и используют имена **Kubernetes node**  в качестве идентификаторов узлов **Portworx node IDs**. Обратите внимание, что Portworx кластеризовал блочное устройство по 20 ГБ от каждого **node** в кластере хранения объемом 60 ГБ **60GB storage cluster**.
- Portworx обнаружил тип носителя блочного устройства **block device** как **magnetic** и создал для этого пул хранения **storage pool**. Если у вас разные типы устройств, например **SSD**, для типа **SSD** создается другой пул хранения **storage pool**.
