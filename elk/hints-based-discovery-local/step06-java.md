### Deploy the Spring hello world app

`kubectl apply -f /root/course/hello-java.yaml `{{execute HOST1}}

### View in Kibana
The logs from the hellow world app will be available in Kibana as soon as the container spins up.  It will take about 90 seconds, so back to Kibana and look at the Apache and Redis data

### Look at the Spring saved search in Discover
These are being processed by the default Filebeat pattern, and are similar to what you would see with fluentd or other log shippers.  Next we will add annotations to the hello-java manifest to tell Filebeat how to stitch together the multi-line logs

