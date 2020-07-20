
There's a script called `install-microservices.sh` that will

Прежде чем мы начнем этот сценарий, нам нужно развернуть все микросервисы (**customer**, **preference**, **recommendation**[v1:v2]).

Есть скрипт **`install-microservices.sh`**, который будет

- **Checkout** исходный код из https://github.com/redhat-developer-demos/istio-tutorial
- Создать рекомендацию: **v2**
- Запустите **`mvn package`** на всех проектах
- создать **docker image**
- Разверните микросервисы с прокси-сервером **sidecar proxy**.

Выполните этот скрипт: `./install-microservices.sh`{{execute T1}}

>  Сценарий займет от 2 до 5 минут. Не беспокойтесь, если увидите сообщения об ошибках.

Когда сценарии заканчиваются, наблюдайте **watch** за созданием Подов, выполняйте: `oc get pods -w`{{execute T1}}

Как только столбец **READY** для микросервисных Подов будет равен 2/2, вы можете нажать `CTRL+C`

Попробуйте микросервис, набрав `curl http://customer-tutorial.[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com`{{execute interrupt T1}}

Должен вернуться:

`customer => preference => recommendation v{1:2} from {hostname}: 1`