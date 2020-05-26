### Scale your deployments and see new pods being monitored
List the existing deployments:

`kubectl get deployments`{{execute HOST1}}

```
NAME                    DESIRED   CURRENT   UP-TO-DATE   AVAILABLE   AGE
frontend                1         1         1            1           6m
hello-java-deployment   1         1         1            1           6m
redis-master            1         1         1            1           6m
redis-slave             1         1         1            1           6m
```

Scale the Spring app up to two replicas:

`kubectl scale --replicas=2 deployment/hello-java-deployment`{{execute HOST1}}

