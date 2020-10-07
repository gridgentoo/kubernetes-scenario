Откройте файл `istiofiles/destination-rule-recommendation-v1-v2.yml`{{open}}.

Откройте файл `istiofiles/virtual-service-recommendation-v2.yml`{{open}}.

Обратите внимание, что **`DestinationRule`** добавляет имя к каждой версии ваших **`recommendation`** deployments, а **`VirtualService`** указывает, что местом назначения будет развертывание **`recommendation`** deployment с именем `version-v2`.

Применим **apply** эти файлы.

`
istioctl create -f ~/projects/istio-tutorial/istiofiles/destination-rule-recommendation-v1-v2.yml -n tutorial
`{{execute T1}}

`
istioctl create -f ~/projects/istio-tutorial/istiofiles/virtual-service-recommendation-v2.yml -n tutorial
`{{execute T1}}

Make sure that the following command is running on `Terminal 2` `while true; do curl http://customer-tutorial.[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com; sleep .2; done`{{execute interrupt T2}}

Убедитесь, что следующая команда выполняется на`Terminal 2` `while true; do curl http://customer-tutorial.[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com; sleep .2; done`{{execute interrupt T2}}

Вы должны увидеть только возврат **`v2`**.
