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

# Enable metrics - probes failing and crashing on this instance.
# helm install metrics-server stable/metrics-server --namespace kube-system 

# Upgrade Go
version=1.14
os=$(go env GOOS)
arch=$(go env GOARCH)
# Remove existing Go install
sudo rm -rf /usr/local/go
# Install new Go version
curl -L https://dl.google.com/go/go${version}.${os}-${arch}.tar.gz | tar -xz -C /usr/local

# Install Kustomize
curl -s "https://raw.githubusercontent.com/\
kubernetes-sigs/kustomize/master/hack/install_kustomize.sh"  | bash
mv kustomize /usr/local/bin/

# Ensure file browser and editor start in clean directory
cd /opt/go/src

{ clear && echo 'Kubernetes with Helm is ready.'; } 2> /dev/null