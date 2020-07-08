First, you have to unlock Jenkins. To do that, we need to have automatically generated password.
As mentioned on the landing page, it is written by default at **/var/jenkins_home/secrets/initialAdminPassword** this location in your container.

To get that password, we will log in to our container(if already logged in then skip to next command).

`docker exec "CONTAINER ID/NAME" /bin/bash
`{{execute}}

Next, we will print that password on the screen by:

`cat /var/jenkins_home/secrets/initialAdminPassword
`{{execute}}

Copy the printed password & paste it into the textbox on Jenkins Page & press continue.

In the next step, we will customize Jenkins with plugins.