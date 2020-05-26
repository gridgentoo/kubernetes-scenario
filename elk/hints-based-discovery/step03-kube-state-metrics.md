### Проверьте, работает ли kube-state-metrics

`kubectl get pods --namespace=kube-system | grep kube-state`{{execute HOST1}}

и создайте kube-state, при необходимости (по умолчанию его там не будет)


`git clone https://github.com/kubernetes/kube-state-metrics.git kube-state-metrics`{{execute HOST1}}

`kubectl create -f kube-state-metrics/kubernetes`{{execute HOST1}}

`kubectl get pods --namespace=kube-system | grep kube-state `{{execute HOST1}}
