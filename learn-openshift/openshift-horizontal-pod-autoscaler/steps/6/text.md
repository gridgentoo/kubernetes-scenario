Once you press Ctrl + C and benchmarking stops, then after a while, the number of pods will go back to normal:
`oc get po`{{execute}}


```
NAME            READY     STATUS    RESTARTS   AGE
httpd-1-5wsb5   1/1       Running   0          35m
httpd-1-gvqg2   1/1       Running   0          34m
```

If you are interested, you can see the collected metrics and autoscaling taking place in the web console. Open the webconsole by Clicking **DashBoard**.

You can clearly see the spikes in CPU load and network traffic that correspond to the ab run. 

We need to delete CPU-based autoscaler before the next exercise:
`oc delete hpa/httpd`{{execute}}