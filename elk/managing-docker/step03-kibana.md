### Deploy Kibana

This docker run command starts Kibana with the default configuration.  If you want to customize the configuration you can pass in environment variables or mount a configuration file.  There is more information about running the official Kibana Docker container at https://www.elastic.co/guide/en/kibana/6.4/docker.html 

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

### Check the health / readiness of Kibana

In the run command that you just ran, there is a health check defined.  This connects to Kibana and ensures that it is available. In the output of the following command you will see the test result.  Just like the check to make sure that Elasticsearch is ready, run this command to wait until Kibana is ready.  This is necessary before deploying Beats, as the Beats need to connect to both Elasticsearch and Kibana to install the modules that customize the experience related to the apps you are running (NGINX, Apache HTTPD, etc.).

`bash /root/course/healthstate.sh kibana`{{execute HOST1}}
