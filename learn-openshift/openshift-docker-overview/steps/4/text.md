In this step, we will run a container from the image we pulled from Docker Hub or a private registry in the previous chapter. We are going to use the docker run command to run a container. Before we do that, let's check if we have any containers running already by using the docker ps command:
`docker ps`{{execute}}

Run a container with the docker run command. Press `Ctrl` + `C` to kill the container.
`docker run --name=mycontainer httpd`{{execute}} 

The container is running, but we cannot leave the terminal and continue working in the foreground. And the only way we can escape it is by sending a TERM signal (Ctrl + C) and killing it.


Run the docker ps command to show that there are no running containers:
`docker ps`{{execute}}


Run docker ps -a to show both running and stopped containers:
`docker ps -a`{{execute}}


There are a few things to note here. The STATUS field says that container mycontainer exited about one minute ago. In order to get container log information, we can use the docker logs command:
`docker logs mycontainer`{{execute}}

- We specified a container name.
- You can, of course, specify the full ID.
- The logs command will output the entire logs of the container.

The last message says caught SIGTERM, shutting down. It happened after we pressed Ctrl + C. In order to run a container in background mode, we can use the -d option with the docker run command:
`docker run --name=backgroundcontainer -d httpd`{{execute}}
> Container_ID

It generates a random ID, the first 12 characters of which are used for the container ID. Along with the generated ID, a random container name is also generated if not provided.

Run docker ps to verify the container ID, name, and status:
`docker ps`{{execute}}