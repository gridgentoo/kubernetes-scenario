#!/bin/sh
set -ex

kubectl create namespace monitoring

helm repo add coreos https://s3-eu-west-1.amazonaws.com/coreos-charts/stable/

helm install coreos/prometheus-operator --name prometheus-operator \
                                        --namespace monitoring

helm install coreos/kube-prometheus --name kube-prometheus \
                                    --namespace monitoring --wait

kubectl patch service kube-prometheus --namespace=monitoring \
                                      --type='json' \
                                      -p='[{"op": "replace",  "path": "/spec/type", "value":"NodePort"}]'

kubectl patch service kube-prometheus-alertmanager --namespace=monitoring \
                                                   --type='json' -p='[{"op": "replace",  "path": "/spec/type", "value":"NodePort"}]'

kubectl patch service kube-prometheus-grafana --namespace=monitoring \
                                              --type='json' -p='[{"op": "replace",  "path": "/spec/type", "value":"NodePort"}]'

kubectl get services -n monitoring
