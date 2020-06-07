### The sample Guestbook application
The application consists of:
![NGINX, Apache httpd, PHP, Redis](https://raw.githubusercontent.com/elastic/katacoda-scenarios/master/images/GuestbookArchWithNGINX.001.png)

### Container configuration notes
All of the containers that make up the application have these things in common:
1. We set the Docker network to `course_stack`
1. We add some labels to the container to specify how the logs and metrics should be collected. When you deploy the NGINX container there is more information on the labels.
1. Logs are written to STDOUT and STDERR

### Deploy the Guestbook application

#### Deploy Redis master
This Redis instance receives new Guestbook entries and writes them to the cache.

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

### Deploy Redis worker
This Redis instance syncs with the master instance and returns the cached content to the frontend web server.

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

### Deploy Apache httpd and PHP
Apache httpd and PHP are served from this container.

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
We will deploy the standard NGINX Docker image with a few configuration changes:
1. mount a custom nginx.conf to add the x-forwarded-for IP addresses passed in by the Katacoda proxy to the access log
1. mount a custom conf.d/default.conf allow the local 172 network to access the server status metrics and forward requests to an Apache httpd server

### Start NGINX
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

Note in the NGINX run command there are labels, these labels are available in the Docker environment, and the Beats detect them and configure log and metric collection.  The labels tell Filebeat that the module name **nginx** should be used to collect, parse, and visualize the logs from this container, and that the access logs are at STDOUT, while the error logs are at STDERR.  Similarly, the labels tell Metricbeat to collect metrics from the container name and port.

You can see these labels with the command:

`docker inspect nginx | grep -A7 Labels`{{execute HOST1}}

### Put some entries in the Guestbook
Open the [Guestbook](https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/)
Type in a message and click Submit.  Send in several messages, and also change the URL by adding `/foo` to generate some 404 errors.  Now return to the Katacoda tab and continue.

