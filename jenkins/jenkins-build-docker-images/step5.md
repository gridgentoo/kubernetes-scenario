### Build

We now have a configured job that will build Docker Images based on our Git repository. The next stage is to test and try it.

#### Task: Build Now

1\. On the left-hand side, select **Build Now**.

>Note: You should see a build scheduled with a (confusing) message "(pending—Jenkins doesn’t have label docker-agent)".

In the background, Jenkins is launching the container and connecting to it via SSH. Sometimes this can take a moment or two.

2\. Remain on the Jenkins Dashboard, but locate the **Status** link, above **Build Now**, which will allow you to watch the progress.<br>

>Note: It's normal for this to take a few moments to complete, please be patient.

3\. Once the status bar shows it's complete, go back to **Terminal**. You can now verify the progress using `docker logs --tail=10 jenkins`{{execute}}.<br>

Are you ready for the big reveal? Let's do it!
