Для **canary deployment** важно отслеживать производительность и поведение вновь **deployed containers**, прежде чем принять решение о продвижении новой версии или ее отмене **rolling it back**. Контейнеры можно контролировать с помощью **Prometheus**. Существует **stable Helm chart**, на которой установлен **Prometheus operator** и некоторые продуманные конфигурации. Чтобы установить и настроить **Prometheus stack** выполните следующие 3 команды:

`curl https://raw.githubusercontent.com/javajon/kubernetes-observability/master/configurations/prometheus-stack.sh | bash -s`{{execute}}

Приведенный выше скрипт включает команду ожидания **wait command**, поэтому для ее завершения потребуется несколько минут.

Roadmap: необходимо добавить **ServiceMonitor** для очистки показателе **hello-world metrics**. На данный момент **metrics** можно в значительной степени увидеть в метриках **node CPU** and **memory metrics**. Рассмотрим эти два **declarations** ():

`kubectl create -n monitoring -f monitoring.yaml`{{execute}}

TODO: пропал **missing yaml**
`kubectl create -n monitoring -f alertmanager-latency-rule.yaml`{{execute}}

Ниже приведены инструкции, которые **configure Prometheus** для наблюдения **watch** за производительностью будущих deployments. 
Но сначала давайте возьмем **Jenkins pipeline** для сборки, развертывания и установки приложения.
