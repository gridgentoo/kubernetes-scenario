Let's fill your cluster will some aliens. First, add a few simple NGINX Pods to the default namespace.

`kubectl create deployment nginx --image=nginx`{{execute}}

`kubectl scale deployment/nginx --replicas=8`{{execute}}

Next, add a few more Pods (aliens) to a second namespace.

`kubectl create namespace more-apps`{{execute}}

`kubectl create deployment ghost --namespace more-apps --image=ghost:3.11.0-alpine`{{execute}}

`kubectl scale deployment/ghost --namespace more-apps --replicas=4`{{execute}}

Label the Deployments and Pods so you can watch their status.

`kubectl label deployment,pod app-purpose=chaos -l app=nginx --namespace default`{{execute}}

`kubectl label deployment,pod app-purpose=chaos -l app=ghost --namespace more-apps`{{execute}}

In the next step, kill and observe the aliens!
