### Deploy Elasticsearch 

Эта команда **docker run** развертывает экземпляр **Elasticsearch instance**. Вы можете прочитать больше в [docs](https://www.elastic.co/guide/en/elasticsearch/reference/6.4/docker.html)

`
docker run -d \
  --name=elasticsearch \
  --label co.elastic.logs/module=elasticsearch \
  --label co.elastic.metrics/module=elasticsearch \
  --label co.elastic.metrics/hosts='${data.host}:9200' \
  --env="discovery.type=single-node" \
  --env="ES_JAVA_OPTS=-Xms256m -Xmx256m" \
  --network=course_stack \
  -p 9300:9300 -p 9200:9200 \
  --health-cmd='curl -s -f http://localhost:9200/_cat/health' \
  docker.elastic.co/elasticsearch/elasticsearch:7.6.2 
`{{execute HOST1}}

### Проверьте здоровье **health** / готовность **Elasticsearch**

В только что выполненной команде запуска определена проверка работоспособности **health check**. Это подключается к **health API** кластера **Elasticsearch**. В выводе следующей команды вы увидите результат теста. Подождите, пока он не вернет **healthy response**, прежде чем задеплоится **Kibana**. Для загрузки **Elasticsearch** может потребоваться минута или две, а затем процессу понадобится еще одна минута, чтобы в первый раз перейти в состояние готовности **ready state**

Скрипт, который вы запустите, вызывает эту команду в цикле, пока команда `docker inspect` не вернет состояние `healthy` state

`docker inspect elasticsearch | jq -r ".[].State.Health.Status`

Посмотри код **healthstate.sh**

`nano /root/course/healthstate.sh`{{execute HOST1}}

Запустим код **healthstate.sh**
 
`bash /root/course/healthstate.sh elasticsearch`{{execute HOST1}}

