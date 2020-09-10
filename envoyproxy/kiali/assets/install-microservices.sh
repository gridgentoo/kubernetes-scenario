#!/bin/bash
mkdir -p /root/projects/istio-tutorial

git clone https://github.com/redhat-developer-demos/istio-tutorial /root/projects/istio-tutorial -b katacoda

oc login -u system:admin

oc new-project tutorial 2> /dev/null || echo "Project already exists"
oc adm policy add-scc-to-user privileged -z default -n tutorial

mvn package -f /root/projects/istio-tutorial/customer/java/springboot -DskipTests
docker build -t example/customer /root/projects/istio-tutorial/customer/java/springboot
oc apply -f <(/root/installation/istio-1.4.2/bin/istioctl kube-inject -f /root/projects/istio-tutorial/customer/kubernetes/Deployment.yml) -n tutorial
oc create -f /root/projects/istio-tutorial/customer/kubernetes/Service.yml -n tutorial 2> /dev/null || echo "Customer Service already exists"

mvn package -f /root/projects/istio-tutorial/preference/java/springboot -DskipTests
docker build -t example/preference:v1 /root/projects/istio-tutorial/preference/java/springboot
oc apply -f <(/root/installation/istio-1.4.2/bin/istioctl kube-inject -f /root/projects/istio-tutorial/preference/kubernetes/Deployment.yml) -n tutorial
oc create -f /root/projects/istio-tutorial/preference/kubernetes/Service.yml -n tutorial 2> /dev/null || echo "Preference Service already exists"

mvn package -f /root/projects/istio-tutorial/recommendation/java/vertx -DskipTests
docker build -t example/recommendation:v1 /root/projects/istio-tutorial/recommendation/java/vertx
oc apply -f <(/root/installation/istio-1.4.2/bin/istioctl kube-inject -f /root/projects/istio-tutorial/recommendation/kubernetes/Deployment.yml) -n tutorial
oc create -f /root/projects/istio-tutorial/recommendation/kubernetes/Service.yml -n tutorial 2> /dev/null || echo "Recommendation V1 already exists"

oc expose service customer -n tutorial 2> /dev/null || echo "Route already exists"
