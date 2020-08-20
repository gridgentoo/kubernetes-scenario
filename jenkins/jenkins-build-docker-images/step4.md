### Create the Job

This step creates a new project which Jenkins will build via our new agent. The project source code is [here](https://github.com/katacoda/katacoda-jenkins-demo). The repository has a Dockerfile; this defines the instructions on how to produce the Docker Image. Jenkins doesn't need to know the details of how our project is built.

#### Task: Create New Job

1\. On the Jenkins dashboard, select **Create new jobs**<br>

2\. Give the job a friendly name such as **Jenkins Job** and select **Freestyle project** and press **OK**.<br>

3\. The build will depend on having access to Docker. Using the **Restrict where this project can be run** we can define the label we set of our configured Docker agent. Set **Label Expression** to **docker-agent**. You should have a configuration of **Label is serviced by no nodes and 1 cloud**.<br>

4\. Under **Source Code Management**, select the Repository type as **Git** and set the Repository to be **`https://github.com/katacoda/katacoda-jenkins-demo`**.<br>

>Note: If Git is not in the Source Code Management list, you need to install the Git plugin as mentioned earlier.

5\. Under Build, we can now add a new Build Step using the dropdown. Select **Execute Shell**.<br>

6\. Because the logical of how to build is specified in our Dockerfile, Jenkins only needs to call build and specify a friendly name.<br>

In this example, use the following commands.

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

Okay, now comes the fun part! Let's go!
