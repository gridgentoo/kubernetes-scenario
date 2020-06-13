#!/bin/sh
set -ex
    
# Roadmap: Perhaps an unbrella chart for this instead of a script
kubectl create namespace monitoring

helm repo add coreos https://s3-eu-west-1.amazonaws.com/coreos-charts/stable/

Create a namespace for the installation target.

`kubectl create namespace monitoring`{{execute}}

helm install prometheus-operator coreos/prometheus-operator --wait --namespace monitoring --set rbacEnable=false
helm install kube-prometheus     coreos/kube-prometheus     --wait --namespace monitoring --set global.rbacEnable=false

kubectl patch service kube-prometheus-prometheus   --namespace=monitoring --type='json' -p='[{"op": "replace", "path": "/spec/type", "value":"NodePort"}]'
kubectl patch service kube-prometheus-alertmanager --namespace=monitoring --type='json' -p='[{"op": "replace", "path": "/spec/type", "value":"NodePort"}]'
kubectl patch service kube-prometheus-grafana      --namespace=monitoring --type='json' -p='[{"op": "replace", "path": "/spec/type", "value":"NodePort"}]'

kubectl get services -n monitoring
