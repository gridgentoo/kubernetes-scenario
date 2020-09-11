Прежде чем мы начнем этот сценарий, нам нужно развернуть все микросервисы **microservices** (**customer**, **preference**, **recommendation**).

Есть скрипт **`install-microservices.sh`**, который

- **Ознакомьтесь** с исходным кодом на https://github.com/redhat-developer-demos/istio-tutorial
- Запустить **`mvn package`** во всех проектах
- Создать образ докера **docker image**
- Разверните микросервисы с помощью дополнительного **sidecar proxy**

Execute this script: `./install-microservices.sh`{{execute T1}}

> The script will take between 2-5 minutes to complete. Don't worry if you see error messages.

Когда скрипты закончатся **scripts ends**, наблюдайте за созданием подов, выполните `oc get pods -w`{{execute T1}}

Как только столбец READY для **microservices pods** станет 2/2, вы можете нажать `CTRL+C`.

Попробуйте микросервис, набрав `curl http://customer-tutorial.[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com`{{execute interrupt T1}}

Он должен вернуть:

`customer => preference => recommendation v1 from {hostname}: 1`
