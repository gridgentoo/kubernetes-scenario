#!/bin/sh

launch.sh

# Helm setup
HELM_VERSION=v3.1.2
curl -fsSL https://get.helm.sh/helm-$HELM_VERSION-linux-amd64.tar.gz | tar -zxvf - -C /usr/local/bin/ linux-amd64/helm --strip=1
helm repo add stable https://kubernetes-charts.storage.googleapis.com/

# Setup dashboard on port 30000
helm install dash stable/kubernetes-dashboard \
--namespace kube-system \
--set=service.type=NodePort \
--set=enableInsecureLogin=true \
--set=service.nodePort=30000 \
--set=service.externalPort=80

source <(kubectl completion bash)
source <(helm completion bash)

# Workaround: Katacoda base image needs fixing
# JAVA_HOME is set to JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre/bin, should be:
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre

{ clear && echo 'Kubernetes with Helm is ready.'; } 2> /dev/null
