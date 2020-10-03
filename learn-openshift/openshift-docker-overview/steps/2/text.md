The first step in running and using a container on your server or laptop is to search and pull a Docker image from the Docker registry using the docker search command.

Let's search for the web server container. The command to do so is:
`docker search httpd`{{execute}}

#### Docker Hub search results

Once the container image is found, we can pull this image from the Docker registry in order to start working with it. To pull a container image to your host, you need to use the docker pull command:
`docker pull httpd`{{execute}} 


Note that Docker uses concepts from union filesystem layers to build Docker images. This is why you can see seven layers being pulled from Docker Hub. One stacks up onto another, building a final image.

By default, Docker will try to pull the image with the latest tag, but we can also download an older, more specific version of an image we are interested in using different tags. The best way to quickly find available tags is to go to https://hub.docker.com/, search for the specific image, and click on the image details:


#### Docker Hub image details
There we are able to see all the image tags available for us to pull from Docker Hub. There are ways to achieve the same goal using the docker search CLI command.
`docker pull httpd:2.2.29`{{execute}} 


#### Working with images
Now we want to check the images available on our local server. To do this, we can use the docker images command:
`docker images`{{execute}} 

If we downloaded a wrong image, we can always delete it from the local server by using the docker rmi command: ReMove Image (RMI). In our case, we have two versions of the same image, so we can specify a tag for the image we want to delete:
`docker rmi httpd:2.2.29`{{execute}} 

The output of the preceding command will not list `httpd:2.2.29` :
`docker images`{{execute}} 
