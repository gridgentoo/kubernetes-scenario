

### Download istio

Download the istio version 1.0.0

`curl -L https://git.io/getLatestIstio | ISTIO_VERSION=1.0.0 sh -`{{execute HOST1}}

### Deploy istio 
Add istio to path and deploy istio modules
`export PATH="$PATH:/root/istio-1.0.0/bin" && cd /root/istio-1.0.0 && \
 kubectl apply -f install/kubernetes/helm/istio/templates/crds.yaml -n istio-system && \
 kubectl apply -f install/kubernetes/istio-demo-auth.yaml  `{{execute HOST1}}


Check the status of the istio pods in the istio-system
`watch kubectl get pods -n istio-system`{{execute HOST1}}

Clear the command when the pods come up
`clear`{{execute interrupt HOST1}}

Extract the Host1 IP
`export EXT_IP=$(hostname -I |  head -n1 | awk '{print $1;}') && \
  sed -i -- 's/extip/'$EXT_IP'/g' /opt/istio-services.yml && \
  kubectl apply -f /opt/istio-services.yml `{{execute HOST1}}

