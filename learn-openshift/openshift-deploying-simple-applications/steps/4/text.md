The following YAML file allows you to define a Service OpenShift object:

           
<pre class="file" data-filename="svc-httpd.yml" data-target="replace">
apiVersion: v1
kind: Service
metadata:
  labels:
    name: httpd
  name: httpd
spec:
  ports:
  - port: 8080
    protocol: TCP
    targetPort: 8080
  selector:
    name: httpd
</pre>

Once the file is in place, you can create the service by running the following command:


`oc create -f svc-httpd.yml`{{execute}}


`oc get svc`{{execute}}

The service shows the same output as previously described:
`curl -s <service-ip>:8080 | head -n4`{{copy}}


#### Creating a route
The service allows an application to be accessible internally via a consistent address:port pair. To be able to access it from outside of the cluster, we need to make sure that an OpenShift Route is created. Once the route is created, OpenShift will expose the service to the outside world using the cluster's router, implemented via an HAProxy Docker container by default.

We assume that previously, you created a service named httpd. 

#### Creating a route by using oc expose
You can create a route using oc expose in the following way:
`oc expose svc httpd`{{execute}}

`oc get route`{{execute}}


You can access application using openshift route by running:
`curl -s httpd-simpleapplication.[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com | head -n 4`{{execute}}


`oc delete route httpd`{{execute}}