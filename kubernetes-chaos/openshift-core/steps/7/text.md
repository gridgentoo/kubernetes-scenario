OpenShift services represent an interface between clients and the actual application running in the pods. A service is an IP:port pair which forwards traffic to backend pods in a round-robin fashion.

By running the oc new-app command, OpenShift creates a service automatically. We can verify this by running the oc get services command:
`oc get services`{{execute}}

We can delete and recreate this service again by running the oc delete and oc expose commands. Before we do that, run the curl command to verify that the service is up and running:
`curl -I <service-IP>:8080`{{copy}}

**Note:** You will need to uupdteservice Cluster-IP in the above command.

```
HTTP/1.1 200 OK
Content-Type: text/html
Content-Length: 39559
```

The status code is 200, which means that the web page is available and the service is running properly:
`oc delete svc/ruby-ex`{{execute}}


Check that the service is deleted and that the service is no longer available:
`oc get svc`{{execute}}


Now, create a new service with the oc expose command by coping and running:
`oc expose pods/<pod-name>`{{copy}}

**Note:** In your case, the container name is going to be different. Rerun `oc get pods`{{execute}} to get the running pod name.

Finally, check that the service is available again by running the curl command:

`oc get svc`{{execute}}

`curl -I <service-IP>:8080`{{copy}}
