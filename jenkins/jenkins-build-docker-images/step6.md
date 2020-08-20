## View Console Output

1\. Once the build has completed you should see the Image and Tags using the Docker CLI `docker images`{{execute}}.<br>

2\. What was built into the Docker Image was a small HTTP server. You can launch it using:<br>
`docker run -d -p 80:80 katacoda/jenkins-demo`{{execute}}

3\. Using curl you should see the server respond:<br>
`curl docker`{{execute}}

4\. Jenkins will have the console output of our build, available via the dashboard. You should be able to access it below:<br>
https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/job/Jenkins%20Job/lastBuild/console

5\. If you rebuilt the project, you would see a version 2 image created and the _:latest_ tag reattached.<br>

Pretty cool , huh?
