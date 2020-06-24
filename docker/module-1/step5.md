In this section, we will learn how to interact with an already running Docker container and force containers to continue running in the background.

1) Run the NGINX image (a web server that services http requests external to the host) and connect to STDIN and a terminal:

`docker container ls`{{execute}}

`docker container run -it --rm --name nginx nginx`{{execute}}

Notice you get dropped into an interactive terminal, but you cannot do anything. Press ctrl+c to exit.

2) Now, run the NGINX image in detached mode using the -d switch:

`docker container ls`{{execute}}

`docker container run -p 80:80 -d --rm --name nginx nginx`{{execute}}

`docker container ls`{{execute}}

Notice the port mapping - port 80 in the container has been mapped to port 80 on the host.
Go to server https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/ and see the NGINX welcome page.

3) Gain terminal access to detached container:

`docker container exec -it nginx bash`{{execute}}

`exit`

`docker container ls`{{execute}}

4) You can also run commands and output the result to the console without actually attaching to a terminal in the container:

`docker container exec -it nginx cat /etc/issue`{{execute}}. We can see that this commands shows us what version of linux the container is running. If we run `cat /etc/issue`{{execute}} in our terminal, we can see our host OS is different than that of the container.

5) Let's stop the container `docker kill nginx`{{execute}}

Now that we have stopped the container, it also does not show when we run `docker container ps -a`{{execute}}. This is because we used the --rm argument in the original run command that deletes the container completely when it stops.

You would use the interactive commands to troubleshoot or debug containers
