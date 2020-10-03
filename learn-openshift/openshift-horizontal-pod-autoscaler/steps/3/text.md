
The autoscaling feature can be applied to deployment configs, so the easiest way to create one is to use the already familiar new-app command:
`oc new-app httpd`{{execute}}

Switch to the _Dashboard_ and login to the OpenShift web console using the same credentials you used above.

* Username: **alice**
* Password: **1234**

**Note:** You can get deployment status in web console as well https://[[HOST_SUBDOMAIN]]-8443-[[KATACODA_HOST]].environments.katacoda.com/console/project/advanced/browse/deployments