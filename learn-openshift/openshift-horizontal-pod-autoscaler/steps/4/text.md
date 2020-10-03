
We used the Apache web server image to create an image stream, which, in turn, is used to create the application. Now that the deploymentconfig is ready to manage pods, we can create a HorizontalPodAutoscaler to manage the deploymentconfig itself:
`oc autoscale dc/httpd --min=2 --max=4 --cpu-percent=10`{{execute}}


Note: We specified 2 as the minimum number of pods that must be maintained at any time so that you can observe the effect of autoscaling quickly without having to generate CPU load on pods to trigger it. We will do that in a few moments as well.

Let's make sure it was created:
`oc get hpa`{{execute}}

```
NAME   REFERENCE              TARGETS   MINPODS MAXPODS REPLICAS  AGE
httpd  DeploymentConfig/httpd 0% / 20%  2       4       2         3m
```

**Note:** If you run this command right after creation, you will most likely see unknown instead of 0% in the preceding output. That is expected because HorizontalPodAutoscaler usually needs a few minutes to collect enough metrics.

In a few minutes, you may list running pods and notice that there are two of them now:
`oc get po`{{execute}}

```
NAME            READY     STATUS    RESTARTS   AGE
httpd-1-5845b   1/1       Running   0          7s
httpd-1-scq85   1/1       Running   0          2m
```