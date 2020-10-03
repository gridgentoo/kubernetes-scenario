
If we've done something wrong with the pod, or it may have broken for some reason, there is a simple way to delete a pod using the kubectl delete pod command:
```
kubectl delete pod <pod-name>
```

We can delete all pods using the --all option:
`kubectl delete pod --all`{{execute}}



**Note:** if you run kubectl get pods, you will see all the containers running again. The reason for this is that, when we run the kubectl run command, it creates several different Kubernetes resources, which we are going to discuss in the following section.

We can delete Kubernetes resources by running kubectl delete all with the -l option:
`kubectl delete all -l app=httpd-demo1`{{execute}}



`kubectl get pods`{{execute}} 


This command will delete all Kubernetes with a httpd-demo1 label only. The other two pods will be still available.

Alternatively, we can delete all Kubernetes resources we have created so far by running the kubectl delete all --all command:
`kubectl delete all --all`{{execute}}