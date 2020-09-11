Прежде чем мы начнем этот сценарий, нам нужно развернуть все микросервисы **microservices** (**customer**, **preference**, **recommendation**).

Есть скрипт **`install-microservices.sh`**, который

- **Ознакомьтесь** с исходным кодом на https://github.com/redhat-developer-demos/istio-tutorial
- Запустить **`mvn package`** во всех проектах
- Создать образ докера **docker image**
- Разверните микросервисы с помощью дополнительного **sidecar proxy**

Execute this script: `./install-microservices.sh`{{execute T1}}

> The script will take between 2-5 minutes to complete. Don't worry if you see error messages.

When the scripts ends, watch the creation of the pods, execute `oc get pods -w`{{execute T1}}

Once that the microservices pods READY column are 2/2, you can hit `CTRL+C`. 

Try the microservice by typing `curl http://customer-tutorial.[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com`{{execute interrupt T1}}

It should return:

`customer => preference => recommendation v1 from {hostname}: 1`
