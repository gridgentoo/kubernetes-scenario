In the following exercise, we will see how two applications that are deployed in different projects can reach each other.

First, let's create a project called demo-1:
`oc new-project demo-3`{{execute}}


Next, create a pod running Apache web server. We will be using the same YAML configuration as before:
`oc create -f httpd-pod.yml`{{execute}}

 
In order to simulate the way real applications interact with each other, we will have to create a service to serve as a sole ingress point for our pod:
`oc expose po/httpd --port 80`{{execute}}

