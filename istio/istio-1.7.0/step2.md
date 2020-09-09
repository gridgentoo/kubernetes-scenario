
Начиная с версии **istio v1.1.5**, метод [установки istio с помощью helm перестали использовать](https://istio.io/zh/docs/setup/install/helm/), вам необходимо использовать [установка istioctl](https://istio.io/zh/docs/setup/install/istioctl/).

## Скачать istio

Вы можете скачать сжатый файл, соответствующий вашей операционной системе, на странице [istio release](https://github.com/istio/istio/releases/tag/1.5.1). 
Файл содержит: установочные файлы, примеры иснтрумены и команды istioctl.

Используйте следующую команду для загрузки istio:

`curl -L https://istio.io/downloadIstio | sh -`

`export ISTIO_VERSION=1.6.1; curl -L https://istio.io/downloadIstio | sh -`{{execute}}

Загруженный пакет istio называется **`istio-1.6.*`** (Последняя версия **istio 1.6**) и содержит:
-**`install/kubernetes`**: содержит установочные файлы YAML, связанные с Kubernetes.
-**`examples/`**: содержит примеры приложений.
-**`bin/`**: содержит клиентский файл istioctl.

Перейдите в каталог, в котором находится пакет istio:

`cd istio-*/`{{execute}}


`pwd`{{execute}}

Используйте следующую команду, чтобы добавить путь клиента **`istioctl`** в **$PATH**:

`export PATH=$PATH:$(pwd)/bin`{{execute}}

На данный момент мы уже можем использовать инструмент командной строки **`istioctl`**, который настраивает плоскость управления и данных **Istio**. 
Инструмент командной строки имеет функцию проверки ввода данных пользователем, которая может предотвратить неправильную установку и пользовательские параметры.

Используйте следующую команду для просмотра дополнительной информации о **`istioctl`**:

`istioctl -h`{{execute}}

`istioctl version`{{execute}}
