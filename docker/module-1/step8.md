In this section we will work with container images.

Lets list all containers that exist on the local system:

`docker image ls`{{execute}}

Now, pull some additional images from the Docker Hub:

`docker image pull nginx`{{execute}}

`docker image pull busybox`{{execute}}

`docker image pull busybox:1.28`{{execute}}

`docker image pull ubuntu:18.04`{{execute}}

Run the following command to see how much space the images are taking:

`docker system df`{{execute}}

Let's add a tag to a local image:

`docker image ls`{{execute}}

`docker tag busybox:latest busybox:digitalacademy.0`{{execute}}

`docker image ls`{{execute}}

Now lets remove some of these images from our system:

`docker image rmi busybox:latest`{{execute}}

`docker image rmi alpine:latest`{{execute}}

`docker image rmi ubuntu:18.04`{{execute}}

`docker image ls`{{execute}}

Running the `docker system df`{{execute}} command shows us that we have freed up space by removing images.
