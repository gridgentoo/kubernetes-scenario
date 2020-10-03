To complete this step, define a pod called `mypod` and with that pod define a container called `myfrontend`, which is based on the official `nginx:latest` docker image and also exposes container port 80. We will send request to nginx at this port.

Create nginx pod by running `kubectl create -f pod.yaml`{{execute HOST1}}

**Note:** It might take few seconds for _nginx_ pod status to become `Running` .

# Protip
You can get the clusterIP of running nginx pod by running: 
``kubectl get pods -o wide``{{execute}}

After that, send request to nginx container using `curl <CLUSTER_IP>`{{copy}} to get response.

```
<h1>Welcome to nginx!</h1>
```
