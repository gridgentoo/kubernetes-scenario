The build process takes some time. During the first phase, you can see a container with -build in its name. This container is deployed from the PHP builder image and is responsible for build operations:
`oc get pod`{{execute}}


**Note:** Please wait for the deployment to complete and all the pods to be running, It will take around **2 minutes** to complete.


After some time, the application will be available. That means that the application's pod should be in a Running state:
`oc get pod`{{execute}}


```
NAME              READY  STATUS     RESTARTS  AGE
phpinfo-1-build   0/1    Completed  0         39s
phpinfo-1-h9xt5   1/1    Running    0         4s
```

OpenShift built and deployed the phpinfo application, which is now available by using its service IP. Let's try to access our application using the curl command:
`oc get svc`{{execute}}

```
NAME    CLUSTER-IP    EXTERNAL-IP PORT(S)            AGE
phpinfo **172.30.54.195** <none>      8080/TCP,8443/TCP  1h
```

`curl -s http://<svc-ip>:8080 | head -n 10`{{copy}}

**Note:** The phpinfo() function displays the PHP configuration as an HTML table.