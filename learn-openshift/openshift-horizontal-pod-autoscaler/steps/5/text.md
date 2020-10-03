

Now, we have to simulate a large number of user requests to our pods to increase the CPU load so that autoscaling takes effect. But to do that, we need to create a route first:
`oc expose svc/httpd`{{execute}}

`oc get route`{{execute}}

```
... httpd-advanced.2886795307-80-kitek02.environments.katacoda.com ...
```

**Note:** Please wait for few seconds for the pods to be runnin before running following command.

At this point, we have everything we need, so let's start simulating CPU load with the ab Apache benchmarking utility:
`ab -c 100 -n 10000000 -H 'Host: httpd-advanced.[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com' http://127.0.0.1/`{{execute}}

```
...
<output omitted>
...
^C
Percentage of the requests served within a certain time (ms)
  50% 46
  66% 56
  75% 66
  80% 73
  90% 95
  95% 124
  98% 171
  99% 200
 100% 528 (longest request)
```
