По своей сути **Kubernetes** работает через **API**. Двоичный файл **kubectl** оборачивает **REST API** в инструмент командной строки, однако вы можете напрямую обращаться к **REST API**, если хотите.

Сначала вам нужно открыть **new shell**, и запустить **kube-proxy**:

`kubectl proxy --port=8080 &`{{execute}}

Теперь мы можем вернуться к нашей первой **shell** и выполнить запросы непосредственно к **API**:

`curl http://localhost:8080/`{{execute}}

Это даст нам список всех конечных точек **API endpoints**, к которым мы можем получить доступ **access**

Давайте получим версию:

`curl http://localhost:8080/version`{{execute}}

Мы также можем проверить работоспособность **health**, **API**-сервера:

`curl http://localhost:8080/healthz`{{execute}}

То же самое касается etcd::

`curl http://localhost:8080/healthz/etcd`{{execute}}

Теперь давайте посмотрим, какие API-интерфейсы приложений поддерживаются:

`curl http://localhost:8080/apis/apps`{{execute}}

Это разные версии **API**, которые поддерживаются в этом кластере **Kubernetes**. 
Kubernetes обычно поддерживает **alpha** и **beta** в дополнение к **production ready components** компонентам. Мы можем видеть это здесь.

Давайте посмотрим на все `v1` (**production-ready**), **app objects** в нашем кластере:

`curl http://localhost:8080/apis/apps/v1`{{execute}}

Здесь показаны все объекты **apps/v1 **и их конфигурация. Давайте выберем определенный тип:

`curl http://localhost:8080/apis/apps/v1/deployments`{{execute}}

**Deployment** - это абстракция высокого уровня, которая управляет контейнерным приложением. 
Теперь у нас есть список всех **v1 Deployments**. Давайте принспектируем **coredns**:

`curl http://localhost:8080/apis/apps/v1/namespaces/kube-system/deployments/coredns`{{execute}}


**Kubernetes API** чрезвычайно мощный и гибкий **flexible**.

Однако вы сохраните **fun** от генерации **HTTP requests** вручную, и теперь мы будем использовать инструмент **kubectl**.
