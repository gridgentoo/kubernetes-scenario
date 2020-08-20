### Plugins

The first step is to configure the [Docker plugin](https://wiki.jenkins-ci.org/display/JENKINS/Docker+Plugin).

The plugin is based on a Jenkins Cloud plugin. When a build requires Docker, it will create a "Cloud Agent" via the plugin. The agent will be a Docker Container configured to talk to our Docker Daemon.

The Jenkins build job will use this container to execute the build and create the image before being stopped. The Docker Image will be stored on the configured Docker Daemon. The Image can then be pushed to a Docker Registry ready for deployment.

#### Task: Install Plugin

1\. Within the Dashboard, select **Manage Jenkins** on the left.<br>

>Note:You can either ignore the error warnings at the top, or simply hit Dismiss buttons.<br>

2\. On the Configuration page, select **Manage Plugins**.<br>

3\. Manage Plugins page will give you a tabbed interface. Click **Available** to view all the Jenkins plugins that can be installed.<br>

4\. Using the search box, search for **Docker**. There are multiple Docker plugins, select **Docker plugin** using the checkbox.<br>

5\. While on this page, also search for and check the **Git plugin** for obtaining the source code from a Git repository.<br>

6\. Click **Install without Restart** at the bottom.<br>

7\. The plugins will now be downloaded and installed.<br>

>Note: Please note this process can take several minutes to complete. However, if the process runs in excess of 5 minutes, return to the **Manage Plugins** page and click the **Installed** tab to verify if installation was a success or not.

Just look to verify that your screen looks something like this:

![image](https://user-images.githubusercontent.com/558905/37979556-dda177aa-31b6-11e8-9dae-c40673e3d196.png)

8\. Once complete, click the link **Go back to the top page**.

Your Jenkins server can now be configured to build Docker Images.
