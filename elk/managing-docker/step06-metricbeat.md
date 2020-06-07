### Start Metricbeat

Before you start Metricbeat, have a look at the configuration.  The hints based autodiscover feature is enabled by uncommenting a few lines of the metricbeat.yml, just  like the filebeat configuration on the previous page.  Use grep to see the lines that enable hints based autodiscover:

`grep -A4 metricbeat.autodiscover course/metricbeat.yml`{{execute HOST1}}

And now start Metricbeat:

`docker run -d \
--net course_stack \
--name=metricbeat \
--user=root \
--volume="/root/course/metricbeat.yml:/usr/share/metricbeat/metricbeat.yml:ro" \
--volume="/var/run/docker.sock:/var/run/docker.sock:ro" \
--volume="/sys/fs/cgroup:/hostfs/sys/fs/cgroup:ro" \
--volume="/proc:/hostfs/proc:ro" \
--volume="/:/hostfs:ro" \
docker.elastic.co/beats/metricbeat:7.6.2 metricbeat -e`{{execute HOST1}}

