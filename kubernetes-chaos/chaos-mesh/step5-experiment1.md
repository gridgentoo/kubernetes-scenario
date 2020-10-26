Ваш первый эксперимент применит к приложению **network delay** сетевую задержку.

## Инсталлируйте пример Web-show приложения 

Инсталлируйте пример приложения в качестве цели для эксперимента. Это приложение разработано проектом **Chaos Mesh** как пример **_hello world_** для вашего первого эксперимента. Предоставляются **YAML** для развертывания и обслуживания. Приложению требуется переменная среды для **TARGET_IP**, который является **IP-адресом** кластера, поэтому этот контекст вы предоставляете как **ConfigMap**. Эта переменная **ConfigMap** упоминается в **Deployment YAML**.


Создайте **ConfigMap** с контекстом **IP context**:

`TARGET_IP=$(kubectl get pod -n kube-system -o wide| grep kube-controller | head -n 1 | awk '{print $6}')`{{execute}}

`kubectl create configmap web-show-context --from-literal=target.ip=${TARGET_IP}`{{execute}}

Примените декларации **declarations** о развертывании для **Deployment и Service**:

`kubectl apply -f web-show-deployment.yaml`{{execute}}

`kubectl apply -f web-show-service.yaml`{{execute}}

Для начала потребуется некоторое время. Вы можете увидеть статус приложения в пространстве имен по умолчанию **default namespace**:

`kubectl get deployments,pods,services`{{execute}}

При запущенном приложении **web-show** к его **web interface** можно получить доступ из **"Web Show"** над областью командной строки или по этой ссылке: https://[[HOST_SUBDOMAIN]]-30081-[[KATACODA_HOST]].environments.katacoda.com/.

## Define - определить эксперимент

В Chaos Mesh установлено несколько пользовательских ресурсов **custom resources**:

`kubectl get crds`{{execute}}

Вы можете ссылаться на эти ресурсы для создания декларативных манифестов **YAML**, которые определяют ваш эксперимент.
Для вашего первого эксперимента вы наложите (_задержку сети_ ) **_network delay_**. 
Задержка определяется в манифесте **_NetworkChaos_** следующим образом:

`ccat network-delay-experiment.yaml`{{execute}}

Эксперимент заявляет, что каждую минуту следует вводить сетевую задержку **network delay** 10ms, которая длится 30 секунд. 
Задержка будет применена только к целевой службе с меткой **"app": "web-show"**. 
Это радиус взрыва **_blast radius_**. Только приложение **web-show** имеет такой **label**:

`kubectl get deployments,pods -l app='web-show'`{{execute}}

## Apply Experiment

Поскольку **Chaos Mesh** следует паттерну **Kubernetes Operator** с **CRD**, эксперимент может быть применен как любой другой объект **Kubernetes**.

`kubectl apply -f network-delay-experiment.yaml`{{execute}}

Сейчас идет эксперимент **running**.

`kubectl get NetworkChaos`{{execute}}

## Observe

<img align="right" width="250" src="./assets/network-delay.png">
Откройте [web-show application](https://[[HOST_SUBDOMAIN]]-30081-[[KATACODA_HOST]].environments.katacoda.com/.
) (или воспользуйтесь вкладкой). Приложение имеет встроенный график, показывающий задержку **latency**, с которой оно сталкивается. 
После проведенного эксперимента вы будете видеть задержку **10ms** каждые **30 секунд**. 
Посмотрите на информационную панель **dashboard**, найдите эксперимент и углубитесь в его детали.

## Обновить эксперимент

В любое время вы можете изменить **YAML declaration** и применить дальнейшие обновления эксперимента с помощью:

`kubectl apply -f network-delay-experiment.yaml`{{execute}}

Эксперимент можно приостановить:

`kubectl annotate networkchaos web-show-network-delay experiment.chaos-mesh.org/pause=true`{{execute}}

и возобновить:

`kubectl annotate networkchaos web-show-network-delay experiment.chaos-mesh.org/pause-`{{execute}}

Поскольку **NetworkChaos** похож на любой другой ресурс **Kubernetes**, эксперимент можно легко удалить.

`kubectl delete -f network-delay-experiment.yaml`{{execute}}
