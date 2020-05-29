### install helm

`curl -LO https://storage.googleapis.com/kubernetes-helm/helm-v2.8.2-linux-amd64.tar.gz
tar -xvf helm-v2.8.2-linux-amd64.tar.gz
mv linux-amd64/helm /usr/local/bin/`{{execute}}

`helm init && helm repo update`{{execute}}

### install spark

see: [spark chart](https://hub.helm.sh/charts/incubator/spark)


`helm repo add incubator https://kubernetes-charts-incubator.storage.googleapis.com`{{execute}}

`helm install incubator/spark --name sparkzep --version 0.1.1 --set Worker.Memory=256Mi`{{execute}}

It'll take a few minute to spin up the cluster. run to check that the pods are all running.

`k get all`{{execute}}


### Adjust the service types.

The helm chart for this deployment creates 2 ext LB's but we need to change them to NodePorts


`k get svc sparkzep-spark-webui`{{execute}}

`k delete svc sparkzep-spark-webui`{{execute}}

`k create -f webui-svc.yaml`{{execute}}

and connect to http 32329   to view the spark master status (takes a minute or two to come up)

https://[[HOST_SUBDOMAIN]]-32329-[[KATACODA_HOST]].environments.katacoda.com

* note that the web ui shows 7077, k8s is redirecting this to 32329 and that you can't conect to any node 

WIP: why are the worker nodes showing  1024, it should be 512?

And lets adjust the zepplin server to run with katacoda

`k get svc sparkzep-zeppelin-contro`{{execute}}

`k delete svc sparkzep-zeppelin-contro`{{execute}}

`k create -f zeppelin-svc.yaml`{{execute}}

https://[[HOST_SUBDOMAIN]]-30466-[[KATACODA_HOST]].environments.katacoda.com





