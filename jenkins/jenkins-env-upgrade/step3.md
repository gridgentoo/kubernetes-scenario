Once the plugins have been installed, you can configure how they launch the Docker Containers. The configuration will tell the plugin which Docker Image to use for the agent and which Docker daemon to run the containers and builds on.

The plugin treats Docker as a cloud provider, spinning up containers as and when the build requires them.

#### Task: SSH Settings

This step configures the SSH settings to communicate with Docker.

1\. Select **Credentials** from the main menu.<br>

2\. Select **global** next to the Jenkins store.<br>

3\. Under **Global credentials** select the link **adding some credentials**.<br>

4\. Jenkins will use SSH to communicate with agents (user and password). Add a new set of "Credentials". The username is **jenkins** and the password is **jenkins**. Be careful about spaces in the user/password and click **Ok** once you're ready to move to the next step.<br>

5\. Now, click **Back to credential domains** and move to the next step.

#### Task: Configure Plugin

This step configures the plugin to communicate with a Docker host/daemon.

1\. Once again, select **Manage Jenkins**.<br>

2\. Select **Configure System** to access the main Jenkins settings.<br>

3\. Scroll to the bottom of the page and locate a dropdown menu button called **Add a new cloud**. Click that button and select **Docker** from the list.<br>

4\. You can now configure the container options. Set the name of the agent to **docker-agent**.<br>

5\. The "Docker URL" is where Jenkins launches the agent container. In this case, we'll use the same daemon as running Jenkins, but you could split the two for scaling. Enter the URL **[tcp://[[HOST_IP]]:2345](tcp://[[HOST_IP]]:2345)**<br>

6\. Use **Test Connection** to verify Jenkins can talk to the Docker Daemon. You should see the Docker version number returned.

#### Task: Configure Image

Our plugin can now communicate with Docker. In this step, we'll configure how to launch the Docker Image for the agent.

1\. Using the Images dropdown, select **Add Docker Template** dropdown.<br>

2\. For the Docker Image, use **benhall/dind-jenkins-agent**. If you want to look at it, the image is configured with a Docker client and available [here](https://hub.docker.com/r/benhall/dind-jenkins-agent).

3\. To enable builds to specify Docker as a build agent, set the **Labels** to **docker-agent**.<br>

4\. Now add the Credentials you created earlier `jenkins/******`.<br>

5\. Finally, go back up the page under Images and expand the **Container Settings** section by clicking the button. In the "Volumes" text box enter **/var/run/docker.sock:/var/run/docker.sock**<br>

6\. Click Save.<br>

Jenkins can now start a Build Agent as a container when required.
