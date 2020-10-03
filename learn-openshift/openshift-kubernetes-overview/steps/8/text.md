
We can quickly take a look at the internals of this pod by running the kubectl describe command:
`kubectl describe pod <podname>`{{copy}}

It gives us enough information to efficiently locate the pod and do the proper troubleshooting when necessary. In our case, we can ssh to Minikube VM and run the curl command to check if the pod is running the web server properly. 

**Note:** You may need to use another IP address for the curl command; in our case it is 172.17.0.4, derived from the kubectl describe command output.

`kubectl get pods -o wide`{{execute}}

`curl <POD-IP>`{{copy}}


```
<html><body><h1>It works!</h1></body></html>
```


Let's expose our pod using service:
`kubectl expose deployment httpd --port 80 --type=NodePort`{{execute}}

The command to get a list of exposed Kubernetes services is kubectl get services:
`kubectl get services`{{execute}}


Note that port 80 was mapped to dynamic port. The port is dynamically chosen in the range 30000–32767.Also, there is a ClusterIP field with the IP address allocated for the httpd-expose service. 

Finally, use curl to check if the httpd server is available from the outside of the Kubernetes cluster:
`curl [[HOST_IP]]:<NodePort>`{{copy}}