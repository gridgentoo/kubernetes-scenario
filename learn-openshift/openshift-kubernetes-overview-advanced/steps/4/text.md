

We can take a look at the series of events that took place during this process by running the kubectl get events command. It shows you what Kubernetes did behind the scenes to launch this application. You will see quite a long list, which may seem confusing at first glance, but we can narrow it down by using the following command: 

`kubectl run httpd1 --image=httpd`{{execute}}

`kubectl get events --sort-by=.metadata.creationTimestamp | tail -n 8`{{execute}}


```
4s 4s ... kubelet, minikube pulling image "httpd"
4s 4s ... replicaset-controller Created pod: httpd1-6d8bb9cdf9-thlkg
4s 4s ... default-scheduler Successfully assigned httpd1-6d8bb9cdf9-thlkg to minikube
4s 4s ... deployment-controller Scaled up replica set httpd1-6d8bb9cdf9 to 1
4s 4s ... kubelet, minikube MountVolume.SetUp succeeded for volume "default-token-dpzmw"
2s 2s ... kubelet, minikube Created container
2s 2s ... kubelet, minikube Successfully pulled image "httpd"
2s 2s ... kubelet, minikube Started container
```