### Пример приложения Guestbook application
Приложение состоит из::
![NGINX, Apache httpd, PHP, Redis](https://raw.githubusercontent.com/elastic/katacoda-scenarios/master/images/GuestbookArchWithNGINX.001.png)

### Замечания по конфигурации Container
Все **containers**, которые составляют **application**, имеют следующие общие черты:
1. Устанавливаем для сети **Docker network** to `course_stack`
1. Мы добавляем некоторые метки в **container**, чтобы указать, как должны собираться **logs and metrics**. При развертывании **NGINX container** на **labels** появляется больше информации.
1. **Logs** пишутся в **STDOUT** и **STDERR**

### Задеплоим **Guestbook application**

#### Задеплоим **Redis master**
Этот **Redis instance** получает новые записи **Guestbook** и записывает их в **cache**.

`docker run --name=redis-master \
  --label co.elastic.logs/module=redis \
  --label co.elastic.logs/fileset.stdout=log \
  --label co.elastic.metrics/module=redis \
  --label co.elastic.metrics/metricsets="info, keyspace" \
  --label co.elastic.metrics/hosts='${data.host}:${data.port}' \
  --env="GET_HOSTS_FROM=dns" \
  --env="HOME=/root" \
  --volume="/data" \
  --network=course_stack \
  --label com.docker.compose.service="redis-master" \
  --detach=true \
  gcr.io/google_containers/redis:e2e redis-server /etc/redis/redis.conf`{{execute HOST1}}

### Задеплоим **Redis worker**
Этот **Redis instance** синхронизируется с **master instance** и возвращает кэшированное содержимое **cached** на **frontend web server**.

`docker run --name=redis-slave \
  --label co.elastic.logs/module=redis \
  --label co.elastic.logs/fileset.stdout=log \
  --label co.elastic.metrics/module=redis \
  --label co.elastic.metrics/metricsets="info, keyspace" \
  --label co.elastic.metrics/hosts='${data.host}:${data.port}' \
  --env="GET_HOSTS_FROM=dns" \
  --volume="/data" \
  --network=course_stack \
  --label com.docker.compose.service="redis-slave" \
  --detach=true \
  gcr.io/google_samples/gb-redisslave:v1 /bin/sh -c /run.sh`{{execute HOST1}}

### Задеплоим **Apache httpd** и **PHP**
**Apache httpd** и **PHP** обслуживаются из этого контейнера **container**.

`docker run \
  --name=frontend \
  --label co.elastic.logs/module=apache2 \
  --label co.elastic.logs/fileset.stdout=access \
  --label co.elastic.logs/fileset.stderr=error \
  --label co.elastic.metrics/module=apache \
  --label co.elastic.metrics/metricsets=status \
  --label co.elastic.metrics/hosts='${data.host}:${data.port}' \
  -v /root/course/apache2.conf:/etc/apache2/apache2.conf:ro \
  -v /root/course/apache-mod-status.conf:/etc/apache2/mods-available/status.conf:ro \
  -v /root/course/remoteip.load:/etc/apache2/mods-enabled/remoteip.load:ro \
  --env="GET_HOSTS_FROM=dns" \
  --network=course_stack \
  --label com.docker.compose.service="frontend" \
  --detach=true \
  gcr.io/google-samples/gb-frontend:v4 apache2-foreground`{{execute HOST1}}


### NGINX
1. Смонтируйте пользовательский файл **nginx.conf**, чтобы добавить **x-forwarded-for IP addresses**, передаваемые прокси-сервером **Katacoda proxy**, в журнал **access log**.
1. Смонтируйте пользовательский файл **conf.d/default.conf**, который позволит локальной сети 172 получать доступ к **metrics** сервера и **forward requests** на **Apache httpd server**.

### Стартуем NGINX
`docker run -d \
--net course_stack \
--label co.elastic.logs/module=nginx \
--label co.elastic.logs/fileset.stdout=access \
--label co.elastic.logs/fileset.stderr=error \
--label co.elastic.metrics/module=nginx \
--label co.elastic.metrics/hosts='${data.host}:${data.port}' \
-v /root/course/nginx.conf:/etc/nginx/nginx.conf:ro \
-v /root/course/nginx-default.conf:/etc/nginx/conf.d/default.conf:ro \
--name nginx \
-p 8080:8080 nginx:1.15.4`{{execute HOST1}}

Обратите внимание, что в команде запуска **NGINX** есть **labels**, эти **labels** доступны в среде **Docker**,  а **Beats** обнаруживают их и настраивают сбор **log and metric**. Метки **labels** указывают **Filebeat**, что имя модуля  **nginx** должно использоваться для сбора, анализа и визуализации журналов **logs** из этого контейнера и что журналы доступа **logs** находятся в **STDOUT**, а журналы ошибок - в **STDERR**. Точно так же **labels** говорят **Metricbeat** собирать метрики из **container name and port**.

Вы можете увидеть эти **labels** с помощью команды:

`docker inspect nginx | grep -A7 Labels`{{execute HOST1}}

### Поместите несколько записей в **Guestbook**
Откройте [Guestbook](https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/)
Введите **message** и **click Submit**. Отправьте несколько сообщений, а также измените URL, добавив `/foo`, чтобы сгенерировать **404 errors**. Теперь вернитесь на вкладку **Katacoda tab** и продолжайте

