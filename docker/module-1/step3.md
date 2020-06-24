The below commands will work with images to create and list containers.

1) Take inventory of current images and containers

`docker image ls`{{execute}}

`docker container ls`{{execute}}

2) Run hello-world image

`docker container run hello-world`{{execute}}

> Notice how the image did not need to be downloaded since we already downloaded it in step 2.

3) What if we delete hello-world image from the local machine?

`docker image rmi -f hello-world`{{execute}}

4) Now try to run the hello-world container again, this time defining the name hello-world.

`docker run --name hello-world hello-world`{{execute}}

Notice how the image is automatically downloaded from the container image registry.

Look at the running containers `docker container ls`{{execute}} The hello-world container is not listed because it ran to completion.

Look at all containers including stopped `docker container ls -a`{{execute}} Now we see hello-world listed as a stopped container and is named "hello-world" because we defined that container name at runtime.

Display all information about a container. In this case, let's inspect hello-world. `docker container inspect hello-world`{{execute}} This command displays extensive information about the container. Take some time to look it over.

Some other container commands:

a) List running containers

`docker container ps`{{execute}}

b)  List all containers

`docker container ps -a`{{execute}}

c) List most recent 2 containers

`docker container ps -n 2`{{execute}}

d) List the last container run

`docker container ps -l`{{execute}}
