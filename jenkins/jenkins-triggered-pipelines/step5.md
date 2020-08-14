Теперь мы создадим наш **Jenkins Pipeline**.

#### Задача: создание **Pipeline Workflow**

1. On the **Jenkins** dashboard, select **create new jobs** under the Welcome message or **new Item* in the sidebar menue.
2. Give the job a friendly name such as **Pipeline Hello World**, select **Pipeline** and press **OK**.
3. On the upper right corner of the Pipeline Script Textbox, find the drop-down menue **try sample pipeline...** and choose **GitHub + Maven**
4. Review the Groovy code. You will see that we will use git for cloning a sample project and we will build the project using the Maven installation we had named "M3".
5. Click **Save**

На следующем этапе мы попробуем это сделать.

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
