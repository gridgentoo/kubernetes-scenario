#!/bin/bash
rm -rf /root/projects/* /root/temp-pom.xml

#TEMPORARY FIX for this image
hostname -I | tr ' ' '\n' | awk NF | awk '{print $1 " master"}' | tee -a /etc/hosts ; systemctl restart dnsmasq ; setenforce 0

wget -c https://github.com/istio/istio/releases/download/1.4.2/istio-1.4.2-linux.tar.gz -P /root/installation

(
  cd /root/installation
  tar -xzf istio-1.4.2-linux.tar.gz
  for file in istio-1.4.2/install/kubernetes/istio-demo.yaml istio-1.4.2/install/kubernetes/helm/istio-init/files/crd-1?.yaml ; do
    sed -i -e '/^  validation:$/,/^  versions:/ {
      /^  versions:/ b
      d
    }' ${file}
  done
)

until $(oc status &> /dev/null); do sleep 1; done;

oc adm policy add-cluster-role-to-user cluster-admin admin

(
  cd /root/installation
  # Install CRDs
  for file in istio-1.4.2/install/kubernetes/helm/istio-init/files/crd-1?.yaml ; do
    oc apply -f ${file}
  done
  # Wait for CRDs
  egrep '^  name:' istio-1.4.2/install/kubernetes/helm/istio-init/files/crd-1?.yaml | awk '{print $3}' | while read crd ; do
    until $(oc get crd $crd &> /dev/null) ; do sleep 1 ; done
  done

  # Install Istio
  oc apply -f istio-1.4.2/install/kubernetes/istio-demo.yaml
  # Wait for Istio
  oc get deployment -n istio-system --no-headers | awk '{print $1}' | while read deployment ; do
    until [ "$(oc get deployment -n istio-system --no-headers $deployment | awk '{print $5}')" -eq 1 ] ; do sleep 1 ; done
  done
)

touch /tmp/initialised
