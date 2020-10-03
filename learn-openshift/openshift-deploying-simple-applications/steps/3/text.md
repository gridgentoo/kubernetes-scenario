
The service may be created in two different ways:

- Using oc expose
- From the YAML/JSON definition

We will describe both methods. You don't have to use both.

You can create a pod using oc expose in the following way:
`oc get pod`{{execute}}


`oc expose pod httpd --name httpd`{{execute}}


`oc get svc`{{execute}}


The preceding command creates a service by exposing the pod, using name=httpd as a selector. You may define a custom service name via the --name option.

The same httpd application will be available from the service IP address, which is 172.30.128.131 in our case, but your output from the previous command most likely will be different:


`curl -s <service-ip>:8080 | head -n4`{{copy}}


Let's delete the service to recreate it using another method, as shown in the following subsection:
`oc delete svc/httpd`{{execute}}