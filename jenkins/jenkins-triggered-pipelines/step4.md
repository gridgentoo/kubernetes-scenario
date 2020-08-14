We now will start a pre-configured Jenkins. You can skip this step, if you have accomplished steps 1-3 successfully.

#### Task: Start pre-configured Jenkins

If you have performed step 1 to 3 already, you can skip this step and go to the next step immediately. If you have skipped setps 1-3, or if they were not successful, follow the following instructions to download a clean pre-configured Jenkins installation:

1. Stop and remove any containers named "jenkins", if required:

`docker stop jenkins; docker rm jenkins`{{execute}}

2. Download and start a pre-configured Jenkins container.

`docker run -d --rm --name jenkins \
    -p 8080:8080 -p 50000:50000 \
    oveits/jenkins:2.46.2-alpine-nologin-with-maven-git-pipelines`{{execute}}
    
You can load the Jenkins' dashboard via the following URL https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/ or by clicking the dashboard tab on the right.

> Note: the image has been created like follows: 

`docker run -d -u root --name jenkins \
 -p 8080:8080 -p 50000:50000 \
 --entrypoint bash \
 jenkins:2.46.2-alpine \
 -c "tail -F /jenkins.log"`{{execute}}

`docker exec -d jenkins \
 bash -c 'git clone https://github.com/oveits/jenkins_home_alpine \
 && export JENKINS_HOME=$(pwd)/jenkins_home_alpine \
 && java -jar /usr/share/jenkins/jenkins.war 2>&1 1>/jenkins.log &'`{{execute}}

Perform the manual steps 1 to 3.

`docker stop jenkins
docker commit jenkins newjenkinsimage`{{execute}}

Create a new container with the correct entrypoint and CMD:
`docker run -d --entrypoint "bash" -p 8080:8080 -p 50000:50000 --name jenkins2 newjenkinsimage -c "JENKINS_HOME=/jenkins_home_alpine java -jar /usr/share/jenkins/jenkins.war"`

For commiting the 

`docker stop jenkins2
docker login`{{execute}}

Add your user credentials of [Docker Hub](https://hub.docker.com/) here... 

Then: 

`docker commit jenkins2 oveits/jenkins:2.46.2-alpine-nologin-with-maven-git-pipelines
docker push oveits/jenkins:2.46.2-alpine-nologin-with-maven-git-pipelines`{{execute}}

Here you need to exchange `oveits` by your own [Docker Hub](https://hub.docker.com/) user name.

Now the image can be used by commands like e.g. `docker run <options> <image> <CMD>`
