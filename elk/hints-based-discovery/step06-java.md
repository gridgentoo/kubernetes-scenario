### Разверните приложение Spring hello world app

`kubectl apply -f /root/course/hello-java.yaml `{{execute HOST1}}

### View in Kibana
logs из приложения hello world будут доступны в Kibana, как только контейнер запустится. Это займет около 90 секунд, поэтому вернитесь в Kibana и посмотрите на данные Apache и Redis.

### Look at the Spring saved search in Discover
Они обрабатываются шаблоном Filebeat по умолчанию и похожи на то, что вы видели бы с fluentd или другими поставщиками Логгов. Далее мы добавим аннотации к манифесту hello-java, чтобы сообщить Filebeat, как объединять многострочные logs

