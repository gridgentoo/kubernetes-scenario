#!/bin/bash
cd /root/projects/

docker run -d --name gitjavacreate -p 8055:8055 ravikalla/devops-selfservice-enterprise

cd /root/projects/
#git clone https://github.com/ravikalla/online-account.git
#cd /root/projects/online-account/

# Sonar Installation
docker run -d --name sonarqube -p 9000:9000 sonarqube

# Jenkins Build
cd /root/projects
sudo chmod 777 /var/run/docker.sock
mkdir -p /jenkins_bkp/jenkins_home
chmod -R 777 /jenkins_bkp
git clone https://github.com/ravikalla/devops-selfservice-enterprise.git
cd devops-selfservice-enterprise
git checkout master
cp Dockerfile-Jenkins-Maven ../Dockerfile
cd ..
docker build -t ravikalla/jenkins-maven-docker:v0.1 .

# Jenkins Run
docker run --detach -v /var/run/docker.sock:/var/run/docker.sock -v $(which docker):$(which docker) -p 9080:8080 -p 50000:50000 -v /jenkins_bkp/jenkins_home:/var/jenkins_home --name jenkinsfordevops ravikalla/jenkins-maven-docker:v0.1

docker network create --driver bridge jenkinssonarbridge
docker network connect jenkinssonarbridge jenkinsfordevops
docker network connect jenkinssonarbridge sonarqube

# Install NGINX
#sudo apt update
#sudo apt --yes --force-yes install nginx

clear scr
#~/.launch.sh
