#!/bin/sh

# kubectl get pods --all-namespaces
while [ "$(kubectl get pods --all-namespaces)" = "No resources found" ]; do 
    echo "Wait for k8s is properly initialized...No resources found"
    sleep 10
done

# ensure kubernetes is initialized
while [ "$(kubectl get pods -l app!=katacoda-cloud-provider -n kube-system -o=jsonpath='{.items[*].status.conditions[?(@.status == "False")].status}')" != "" ]; do 
    echo "Wait for k8s is properly initialized..."
    sleep 10
done

kubectl get pods --all-namespaces


# untaint control plane
kubectl taint nodes --all node-role.kubernetes.io/master-

export ISTIO_VERSION=1.6.8

[ ! -d "$HOME/istio-$ISTIO_VERSION/bin" ] && curl -sS -L https://istio.io/downloadIstio | sh -

export PATH=$HOME/istio-$ISTIO_VERSION/bin:$PATH
[ ! -d "$HOME/exercise" ] && mkdir $HOME/exercise

# workaround for cni katacoda failing 
ssh -o "StrictHostKeyChecking no" node01 'ip link set cni0 down'
ssh -o "StrictHostKeyChecking no" node01 'brctl delbr cni0'
ip link set cni0 down
brctl delbr cni0
kubectl scale deployment coredns --replicas=0 -n kube-system

while [ "$(kubectl get pods -l app!=katacoda-cloud-provider -n kube-system -o=jsonpath='{.items[*].status.conditions[?(@.status == "False")].status}')" != "" ]; do 
    echo "Waiting for coredns pods to scale down..."
    sleep 10
done

kubectl scale deployment coredns --replicas=2 -n kube-system

while [ "$(kubectl get pods -l app!=katacoda-cloud-provider -n kube-system -o=jsonpath='{.items[*].status.conditions[?(@.status == "False")].status}')" != "" ]; do 
    echo "Waiting for coredns pods to scale up..."
    sleep 10
done



istioctl install --set profile=demo --readiness-timeout='10m0s'
sleep 10

# scale down istio ingress
kubectl -n istio-system scale deployment istio-ingressgateway  --replicas=0
while [ "$(kubectl get pods -l app=istio-ingressgateway -n istio-system -o=jsonpath='{.items[*].status.conditions[?(@.status == "False")].status}')" != "" ]; do 
    echo "Scaling down istio-ingressgateway...."
    sleep 10
done

echo "Patch istio-ingressgateway..."

# patch ingress gateway
kubectl -n istio-system patch service istio-ingressgateway -p "$(cat /tmp/node-port.yaml)"
kubectl -n istio-system patch --type="merge" service istio-ingressgateway -p "$(cat /tmp/immutable-ports.yaml)"
kubectl -n istio-system patch service istio-ingressgateway -p "$(cat /tmp/traffic-policy.yaml)"
kubectl -n istio-system patch deployment istio-ingressgateway -p "$(cat /tmp/antiaffinity.yaml)"


kubectl -n istio-system scale deployment istio-ingressgateway  --replicas=2
while [ "$(kubectl get pods -n istio-system -o=jsonpath='{.items[*].status.conditions[?(@.status == "False")].status}')" != "" ]; do 
    echo "Scaling up istio-ingressgateway...."
    sleep 10
done

kubectl get pods -n istio-system
echo "Done."

kubectl -n istio-system patch service kiali -p "$(cat /tmp/node-port.yaml)"
kubectl -n istio-system patch --type="merge" service kiali -p "$(cat /tmp/immutable-port-kiali.yaml)"

kubectl -n istio-system patch service tracing -p "$(cat /tmp/node-port.yaml)"
kubectl -n istio-system patch --type="merge" service tracing -p "$(cat /tmp/immutable-port-jaeger.yaml)"

kubectl -n istio-system patch service grafana -p "$(cat /tmp/node-port.yaml)"
kubectl -n istio-system patch --type="merge" service grafana -p "$(cat /tmp/immutable-port-grafana.yaml)"


kubectl label namespace default istio-injection=enabled