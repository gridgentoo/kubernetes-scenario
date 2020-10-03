We highlighted a source element that specifies which directory to use during the build. Now, if there is a task to point to another context directory, we just need to update the bc/redis object by changing spec.source.contextDir in the object definition. This can be achieved in several ways:

- Manually using oc edit
- In a script using oc patch


Below is an example of how to use the oc patch command to update the object content:
`oc patch bc/redis --patch '{"spec":{"source":{"contextDir":"5.0"}}}'`{{execute}}


`oc get bc/redis -o yaml|grep contextDir:`{{execute}}

Well, we updated our build configuration but nothing happened. Our pod has not been changed. This indicates that the build process was not triggered. You may verify that by displaying pods through oc get pod.

If there is a need to initiate the application rebuild process, oc start-build must be run. This command starts a new build from the available build configuration.

Let's list all current builds:
`oc get build`{{execute}}


```
NAME         TYPE     FROM         STATUS     STARTED         DURATION
redis-1      Docker   Git@d24f2be  Complete   12 minutes ago  6s
```

So, recently, we initiated a build, which was completed some time ago. Let's try to run the build again:
`oc start-build bc/redis`{{execute}}

The build creates a number of new pods representing the new version (version 2). After some time, the pod statuses will be changed:
`oc get pod`{{execute}}

You can see that redis is now going through Build and Deploy stages before the new version of redis container is up and running.
`oc get pod`{{execute}}


Well, it looks like that build has been completed:
`oc get build`{{execute}}

```
NAME      TYPE       FROM            STATUS     STARTED         DURATION
redis-1   Docker     Git@d24f2be     Complete   15 minutes ago  6s
redis-2   Docker     Git@d24f2be     Complete   2 minutes ago   6s
```