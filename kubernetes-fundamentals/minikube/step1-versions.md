Этот Katacoda-сценарий предоставляет последнюю версию инструмента командной строки Minikube (CLI). Katacoda предоставила вам виртуальную машину Linux, полностью способную обслуживать Minikube в оболочке Bash справа.

> После этого курса, если вы также хотите запустить Minikube локально, следуйте этим [инструкциям по установке](https://kubernetes.io/docs/tasks/tools/install-minikube/).

Проверьте текущую версию Minikube, предоставленную Katacoda.

`minikube version`{{execute}}

Это должно быть достаточно близко к последнему релизу В среднем, новая версия Minikube выпускается один раз в месяц, и на ней есть_boat load_ of GitHub stars.

`minikube update-check`{{execute}}

Текущие настройки могут быть перечислены.

`minikube config view`{{execute}}

На следующем этапе Minikube будет запущен.
