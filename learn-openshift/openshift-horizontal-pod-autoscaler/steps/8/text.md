Let's go ahead and generate traffic for the application, just like in the previous section, but establish 1000 concurrent connections this time, instead of 100:
`ab -c 1000 -n 10000000 -H 'Host: httpd-advanced.[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com' http://127.0.0.1/`{{execute}}


After ab is finished generating traffic, the number of pods slowly goes down.

**Note:** It is possible to observe short bursts in the number of replicas if you put too much load on the service. This is normal and you may see from events that the deploymentconfig scales, for example, from 3 to 6 without transient states, then quickly detects the anomaly and corrects it by scaling back to the maximum value.Due to the specifics of memory utilization by pods, it's common that the deploymentconfig/replicationcontroller doesn't fully scale back to the minimum number of replicas.

The exercise is over, so it's time to clean-up:
`oc delete all --all`{{execute}}

`oc delete limits/my-limits`{{execute}}