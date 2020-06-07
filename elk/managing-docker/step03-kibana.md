### Задеплоим Кибану **Kibana**

Эта команда запуска **docker** запускает **Kibana** с конфигурацией по умолчанию. Если вы хотите настроить конфигурацию, вы можете передать переменные окружения или смонтировать файл конфигурации. Более подробную информацию о запуске официального контейнера **Kibana Docker** можно найти по адресу https://www.elastic.co/guide/en/kibana/6.4/docker.html .

`
docker run -d \
  --name=kibana \
  --user=kibana \
  --network=course_stack -p 5601:5601 \
  --health-cmd='curl -s -f http://localhost:5601/login' \
  --label co.elastic.logs/module=kibana \
  --label co.elastic.metrics/module=kibana \
  --label co.elastic.metrics/hosts='${data.host}:${data.port}' \
  docker.elastic.co/kibana/kibana:7.6.2 
`{{execute HOST1}}

### Проверим здоровье **health** / готовность **Kibana**

В только что выполненной команде запуска определена проверка работоспособности **health check**. Это дает подключение к **Kibana** и обеспечивает его доступность. В выводе **output** следующей команды вы увидите результат теста **test result**. Точно так же, как **check**, чтобы убедиться, что **Elasticsearch** готов, выполните эту команду, чтобы подождать, пока **Kibana is ready** не будет готов. Это необходимо перед развертыванием **Beats**, поскольку **Beats** необходимо подключиться как к **Elasticsearch**, так и к **Kibana** для установки модулей, которые настраивают взаимодействие с приложениями, которые вы используете (NGINX, Apache HTTPD и т. Д.).

Посмотри код healthstate.sh
`nano /root/course/healthstate.sh`

Запустим код healthstate.sh
`bash /root/course/healthstate.sh kibana`{{execute HOST1}}
