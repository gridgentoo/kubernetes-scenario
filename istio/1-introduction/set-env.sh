#!/bin/bash
rm -rf /root/projects/* /root/temp-pom.xml

#TEMPORARY FIX for this image
hostname -I | tr ' ' '\n' | awk NF | awk '{print $1 " master"}' | tee -a /etc/hosts ; systemctl restart dnsmasq ; setenforce 0

wget -c https://github.com/istio/istio/releases/download/1.0.5/istio-1.0.5-linux.tar.gz -P /root/installation

until $(oc status &> /dev/null); do sleep 1; done; 

oc adm policy add-cluster-role-to-user cluster-admin admin

echo "Downloading Istio..."
until $(tar -tvf /root/installation/istio-1.0.5-linux.tar.gz &> /dev/null); do (echo -n .; sleep 2); done;
/usr/local/bin/launch.sh
mkdir -p /root/installation && cd ~/installation
clear
echo "Tutorial Ready."
