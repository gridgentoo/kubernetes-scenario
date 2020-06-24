The below commands will let you work with images.

1) List images

`docker image ls`{{execute}}

2) Pull hello-world image from the container image registry (in this case, Docker Hub)

`docker image pull hello-world`{{execute}}

3) Pull the latest Alpine image from the container image registry

`docker image pull alpine:latest`{{execute}}

4) List images on the local machine

`docker image ls`{{execute}}

5) Remove images stored locally

`docker image rmi alpine:latest`{{execute}}

6) List images again. Note that Alpine is no longer listed

`docker image ls`{{execute}}
