We now will start a pre-configured Jenkins. You can skip this step, if you have accomplished steps 1-3 successfully.

#### Task: Start pre-configured Jenkins

If you have performed step 1 to 3 already, you can skip this step and go to the next step immediately. If you have skipped setps 1-3, or if they were not successful, follow the following instructions to download a clean pre-configured Jenkins installation:

1\. Stop and remove any containers named "jenkins", if required:

`docker stop jenkins && \
docker rm jenkins`{{execute}}

2\. Download and start a pre-configured Jenkins container.

`docker run -d --rm --name jenkins \
    -p 8080:8080 -p 50000:50000 \
    oveits/jenkins:2.46.2-alpine-nologin-with-maven-git-pipelines`{{execute}}

You can load the Jenkins' dashboard via the following URL https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/ or by clicking the dashboard tab on the right.

> Note: the steps how the image has been created are described [in the Appendix of this blog post](http://wp.me/p6C5gC-NZ).
