The first step is to configure the [Docker plugin](https://wiki.jenkins-ci.org/display/JENKINS/Docker+Plugin). The plugin is based on a Jenkins Cloud plugin. When a build requires Docker, it will create a "Cloud Agent" via the plugin. The agent will be a Docker Container configured to talk to our Docker Daemon.

The Jenkins build job will use this container to execute the build and create the image before being stopped. The Docker Image will be stored on the configured Docker Daemon. The Image can then be pushed to a Docker Registry ready for deployment.

#### Task: Install Plugin

1\. Within the Dashboard, select **Manage Jenkins** on the left.<br>

2\. On the Configuration page, select **Manage Plugins**.<br>

3\. Manage Plugins page will give you a tabbed interface. Click **Available** to view all the Jenkins plugins that can be installed.<br>

4\. Using the **Filter** search box, search for **Docker plugin**. There are multiple Docker plugins, so be careful the you select **Docker plugin** using the checkbox.<br>

5\. While on this page, search and install the **Git plugin** for obtaining the source code from a Git repository.<br>

6\. Click **Install without Restart** at the bottom.<br>

7\. The plugins will now be downloaded and installed. Once complete, click the link **Go back to the top page**.<br>

Your Jenkins server can now be configured to build Docker Images.
