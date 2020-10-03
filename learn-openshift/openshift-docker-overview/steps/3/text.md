The Docker CLI allows us to export and import Docker images and container layers using export/import or save/load Docker commands. The difference between save/load and export/import is that the first one works with images including metadata, but the export/import combination uses only container layers and doesn't include any image metadata information such as name, tags, and so on.

The docker export will fetch the whole container, like a snapshot of a regular VM. It saves the OS, of course, but also any change a you made and any data file written during the container life. This one is more like a traditional backup:
`docker save httpd -o httpd.tar`{{execute}}

`ls -l httpd.tar`{{execute}}

To load the image back from the file, we can use the docker load command. Before we do that, though, let's remove the httpd image from the local repository first:
`docker rmi httpd:latest`{{execute}}


We verify that we do not have any images in the local repository:
`docker images`{{execute}}

Load the image file we previously saved with the docker save command. Like docker export and docker import, this command forms a pair with Docker save and thus is used for loading a saved container archive with all intermediate layers and metadata to the Docker cache:
`docker load -i httpd.tar`{{execute}}

#### Verify
Check the local docker images with docker image command:
`docker images`{{execute}}

