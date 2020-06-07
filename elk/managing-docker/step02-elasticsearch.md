### Deploy Elasticsearch 

This docker run command deploys a development Elasticsearch instance.  You can read more in the [docs](https://www.elastic.co/guide/en/elasticsearch/reference/6.4/docker.html)

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

### Check the health / readiness of Elasticsearch

In the run command that you just ran, there is a health check defined.  This connects to the cluster health API of Elasticsearch.  In the output of the following command you will see the test result.  Wait until it returns a healthy response before deploying Kibana.  It may take a minute or two to download Elasticsearch and then it takes another minute for the process to get to the ready state the first time.

The script you will run calls this command in a loop until the `docker inspect` command returns a `healthy` state:

`docker inspect elasticsearch | jq -r ".[].State.Health.Status`

`bash /root/course/healthstate.sh elasticsearch`{{execute HOST1}}

