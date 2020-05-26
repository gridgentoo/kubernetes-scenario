### Check to see if kube-state-metrics is running

`kubectl get pods --namespace=kube-system | grep kube-state`{{execute HOST1}}

and create it if needed (by default it will not be there)


`git clone https://github.com/kubernetes/kube-state-metrics.git kube-state-metrics`{{execute HOST1}}

`kubectl create -f kube-state-metrics/kubernetes`{{execute HOST1}}

`kubectl get pods --namespace=kube-system | grep kube-state `{{execute HOST1}}
