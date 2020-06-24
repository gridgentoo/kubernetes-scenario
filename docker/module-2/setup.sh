#!/bin/sh

sleep 1

mkdir /old
cp -r /root/resources/* /old/
rm -rf /root/resources

mkdir -p /root/resources
cp -r /root/newresources/* /root/resources/
rm -rf /root/newresources

tar -xf /root/resources/simple.tgz -C /root/resources
rm /root/resources/simple.tgz

tar -xf /root/resources/buildyourown.tgz -C /root/resources
rm /root/resources/buildyourown.tgz

tar -xf /root/resources/multistage.tgz -C /root/resources
rm /root/resources/multistage.tgz
