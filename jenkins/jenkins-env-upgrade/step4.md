This step creates a new project which Jenkins will build via our new agent. The repository has a Dockerfile; this defines the instructions on how to produce the Docker Image. Jenkins doesn't need to know the details of how our project is built.

#### Task: Create New Job

1\. On the Jenkins dashboard, select **Create new jobs**<br>

2\. Give the job a friendly name such as **Jenkins Environment** and select **Freestyle project**.<br>

3\. The build will depend on having access to Docker. Using the **Restrict where this project can be run** we can define the label we set of our configured Docker agent. Set the **Label Expression** to **docker-agent**. Click the "Advanced" button and you should have a configuration of "
Label docker-agent is serviced by no nodes and 1 cloud".<br>

4\. Under **Source Code Management** Select the Repository type as **Git** and set the **Repository URL** to be **https://github.com/katacoda/katacoda-jenkins-demo**.

>Note: if Git is not in the "Source Code Management" list, you need to install the `Git plugin` as before.<br>

5\. We can now add a new **Build Step** using the dropdown. Select **Execute Shell**.<br>

6\. Because the logic of how to build is specified in our Dockerfile, Jenkins only needs to call build and specify a friendly name.<br>

In this example, copy the following commands into the appropriate place:

```
ls
docker info
docker build -t katacoda/jenkins-demo:${BUILD_NUMBER} .
docker tag katacoda/jenkins-demo:${BUILD_NUMBER} katacoda/jenkins-demo:latest
docker images
```

The first stage lists all the files in the directory which will be built. When calling _docker build_ we use the Jenkins build number as the image tag. This allows us to version our Docker Images. We also tag the build with _latest_.

At this point, or in an additional step, you could execute a `docker push` to upload the image to a centralized Docker Registry.

7\. Our build is now complete. Click **Save**.
