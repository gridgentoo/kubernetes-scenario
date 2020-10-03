
You can scale pods in your application using the oc scale command, but it has two disadvantages:
- It has to be run manually every time you need to scale a pod up or down
- You have to take into account CPU and RAM utilization yourself.


This approach doesn't allow businesses to adapt quickly to constantly changing customers demands. There is a better way—HorizontalPodAutoscaler.

**Note:** Autoscaling can only track CPU and RAM usage.Traffic-based autoscaling, for instance, isn't supported.

Let's login as system:admin first: `oc login -u system:admin`{{execute}}

Let's see if Hawkular, Cassandra, and Heapster pods are up and running:
`oc get po -n openshift-infra`{{execute}}

```
NAME                       READY STATUS  RESTARTS AGE
hawkular-cassandra-1-ffszl 1/1   Running 0        10m
hawkular-metrics-bl6jh     1/1   Running 0        10m
heapster-brvfd             1/1   Running 0        10m
```

**Note:** Please wait for all the pods to be running before proceeding to next steps. It can take around 3-4 minutes.
