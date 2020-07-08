In previous step, we pulled the Jenkins image from Docker Hub.
So now its time to run a container based on this image.

To do this, type following command:

`docker run -d -u root -p 80:8080 jenkins
`{{execute}}

### Here,

**-d** : Detached Mode. Run container in background and print container ID

**-u** : User. Username or UID. 'root' in this case

**-p** : Publish. Publish a container’s port(s) to the host

**jenkins** : Name of the base image to run this container



After running this command, a new container will be created & its Container ID will be printed on terminal.