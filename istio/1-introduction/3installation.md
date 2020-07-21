Чтобы установить **Istio** в кластере, нам нужно сначала убедиться, что мы вошли в систему как пользователь **`system:admin`** user.

Чтобы войти в кластер **OpenShift**, введите `oc login -u system:admin`{{execute T1}}

Теперь, когда вы вошли в систему, пришло время извлечь существующую установку **istio**: `tar -xvzf istio-1.0.5-linux.tar.gz`{{execute T1}}

## Перед установкой

**Istio** использует [Custom Resources](https://kubernetes.io/docs/concepts/extend-kubernetes/api-extension/custom-resources/#customresourcedefinitions) такие как **`VirtualService`**s и **`DestinationRule`**s.

Чтобы позволить **OpenShift/Kubernetes** понять **understand** эти значения, нам сначала нужно установить файл **«CustomResourceDefinitions»** с помощью команды
`oc apply -f istio-1.0.5/install/kubernetes/helm/istio/templates/crds.yaml`{{execute T1}}


## Продолжить установку

Istio предоставляет файл **`install/kubernetes/istio-demo.yaml`**, который содержит определение всех объектов, которые необходимо создать в кластере **Kubernetes**.

Давайте применим эти определения к кластеру, выполнив `oc apply -f istio-1.0.5/install/kubernetes/istio-demo.yaml`{{execute T1}}

После выполнения будут созданы объекты **Istio objects**.

Чтобы посмотреть **watch** создание Подов, выполните `oc get pods -w -n istio-system`{{execute T1}}

После того, как они все **`Running`**, вы можете нажать **`CTRL+C`**. Это завершает этот сценарий.

## Создать внешние маршруты **external routes**

**OpenShift** использует концепцию маршрутов **Routes** для предоставления **expose HTTP services** за пределами кластера.

Давайте создадим маршруты к внешним службам **external services**, таким как **`Grafana`**, **`Prometheus`**, **`Tracing`** и т. д., используя следующую команду:

`oc expose svc istio-ingressgateway -n istio-system; \
oc expose svc servicegraph -n istio-system; \
oc expose svc grafana -n istio-system; \
oc expose svc prometheus -n istio-system; \
oc expose svc tracing -n istio-system`{{execute interrupt T1}}

## Добавьте **Istio** к пути **path**

Теперь нам нужно добавить **`istioctl`** к пути **path**.

Выполнять `export PATH=$PATH:/root/installation/istio-1.0.5/bin/`{{execute interrupt T1}}.

Теперь попробуй это. Проверьте версию `istioctl`. 

Выполнять `istioctl version`{{execute T1}}.

