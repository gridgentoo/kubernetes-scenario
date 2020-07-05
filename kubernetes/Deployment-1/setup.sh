#!/bin/sh

sleep 1

mkdir /old
cp -r /root/resources/* /old/
rm -rf /root/resources

mkdir -p /root/resources
cp -r /root/newresources/* /root/resources/
rm -rf /root/newresources

kubectl apply -f https://gist.githubusercontent.com/sylus/1237af2e74fa686ac8f0aa54c45c3294/raw/89089ecdd7861db983a754517ca37a06eab4c7c8/kube-dashboard.yml
