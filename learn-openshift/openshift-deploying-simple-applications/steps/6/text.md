

oc new-app is a very simple utility, yet it's powerful enough to satisfy most simple deployments.

**Note:**
oc new-app doesn't create a route when deploying an application from its Docker image!

The functionality provided by oc new-app is also exposed via a web console which is what developers usually are inclined to use. 

Using oc new-app with default options

Let's delete the resources created previously:
`oc delete all --all`{{execute}}


**Note:**
Another method to delete everything is to delete the project and create it again.

Recently, we showed that OpenShift comes with an image stream that contains the path to the OpenShift-ready httpd image. The oc new-app utility uses Docker images referenced by image streams by default.

Here is an example of creating a basic httpd application:
`oc new-app httpd`{{execute}}


Run `oc status`{{execute}} to view your app.

The deployment process takes some time. Once everything is ready, you can check that all resources have been created:
`oc get all`{{execute}}

```
NAME REVISION DESIRED CURRENT TRIGGERED BY
deploymentconfigs/httpd 1 1 1 config,image(httpd:2.4)

NAME READY STATUS RESTARTS AGE
po/httpd-1-n7st4 1/1 Running 0 31s

NAME DESIRED CURRENT READY AGE
rc/httpd-1 1 1 1 32s

NAME CLUSTER-IP EXTERNAL-IP PORT(S) AGE
svc/httpd 172.30.222.179 <none> 8080/TCP,8443/TCP 33s
``` 

Let's make sure that the proper image has been used:
`oc describe pod <httpd-pod-name> | grep Image:`{{copy}}

What is left is to expose the service to make the application externally available:

`oc expose svc httpd`{{execute}}

`curl -s httpd-simpleapplication.[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com | head -n 4`{{execute}}


