
OpenShift started a new build, versioned as 2, which is present in the names of the pods spawned by the new build. Once everything is complete, your application will be redeployed:
`oc get pod`{{execute}}


The latest version of the build is now 2:
`oc get bc`{{execute}}

```
NAME    TYPE   FROM       LATEST
phpinfo Source Git@master 2
```

A list of all builds is kept by OpenShift for future inspection:
`oc get build`{{execute}}

```
NAME      TYPE   FROM        STATUS   STARTED            DURATION
phpinfo-1 Source Git@638030d Complete 2 hours ago        34s
phpinfo-2 Source Git@638030d Complete About a minute ago 7s
```


Use the following code to clean everything up for the next lab:
`oc delete all --all`{{execute}}

`oc delete project phpinfo`{{execute}}