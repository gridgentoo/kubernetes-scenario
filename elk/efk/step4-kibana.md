Создайте пространство имен для цели установки.

`kubectl create namespace logs`{{execute}}

Задепоим Кибану. Служба будет на порту NodePort на 31000.

`helm install kibana stable/kibana --namespace=logs --set env.ELASTICSEARCH_HOSTS=http://elasticsearch-client:9200 --set service.type=NodePort --set service.nodePort=31000`{{execute}}

> Предупреждение о безопасности. Этот NodePort преднамеренно выставляет логги во внешний мир для демонстрационных целей. Тем не менее, для производственных кластеров Kubernetes никогда не показывать сервис панели управления Kibana миру без какой-либо аутентификации. 

Kibana стартует и станет доступной через несколько минут.
