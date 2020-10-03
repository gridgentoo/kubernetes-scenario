We now have all the information on how to build an application from source code. OpenShift puts together all the information (provided by you and inferred from the source code) and starts a new build. Each build has a sequential number, starting from 1. You can display all builds by running the following command:


`oc get build`{{execute}}

```
NAME      TYPE   FROM        STATUS   STARTED     DURATION
phpinfo-1 Source Git@638030d Complete 2 hours ago 34s
```

This build is reported as Complete, as our application is already up and running.

Starting a new build
If an application's source code was updated, you can trigger the rebuild process by running the oc start-build command. The build itself is managed by the build configuration.

First, we need to gather information on all available build configurations:
`oc get bc`{{execute}}

As you can see, we only have one build, phpinfo, and it was deployed only once; hence, the number 1.

Let's start a new build, as follows:
`oc start-build phpinfo`{{execute}}

`oc get pod`{{execute}}

```
NAME             READY  STATUS    RESTARTS AGE
phpinfo-1-build  0/1    Completed 0        2h
phpinfo-1-h9xt5  1/1    Running   0        2h
phpinfo-2-build  0/1    Init:0/2  0        3s
```