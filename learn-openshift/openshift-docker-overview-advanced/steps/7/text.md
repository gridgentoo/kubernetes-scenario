The Docker community has Docker images for most popular software applications. These include, for example, images for web servers (Apache, Nginx, and so on), enterprise application platforms (JBoss EAP, Tomcat), images with programming languages (Perl, PHP, Python), and so on.

There are a number of ways to create a new docker image:

**Commit:** Creating a Docker image from a running container.

**Import/Export:** Running container layers will be saved to a filesystem using docker export and then the image will be recreated using docker import.

**From scratch:** Building a base Docker image. We use special Dockerfile instructions.


#### Docker Commit
The general recommendation is that all Docker images should be built from a Dockerfile to create clean and proper image layers without unwanted temporary and log files, despite the fact that some vendors deliver their Docker images without an available Dockerfile . If there is a need to modify that existing image, you can use the standard docker commit functionality to convert an existing container to a new image.

As an example, we will try to modify our existing httpd container and make an image from it.

First, we need to get the httpd image:
`docker pull httpd`{{execute}}

Next, we need a container to be running. That container will be used as a template for a future image
`docker run -d --name httpd httpd`{{execute}}

Now we can connect to the container and modify its layers. As an example, we will update index.html:
`docker exec -it httpd /bin/sh`{{execute}}

`echo "This is a custom image" > htdocs/index.html`{{execute}}

`exit`{{execute}}

Let's see the changes we made using the docker diff command. This command shows you all files that were modified from the original image. The output looks like this:
`docker diff httpd`{{execute}}

```
C /usr
C /usr/local
C /usr/local/apache2
C /usr/local/apache2/htdocs
C /usr/local/apache2/htdocs/index.html
...
output truncated for brevity
...
```

The following table shows the file states of the docker diff command:

Symbol | Meaning
--- | ---
`A` | *A file or directory was added*
`D` | *A file or directory was deleted*
`C` | *A file or directory was changed*
 

In our case, docker diff httpd command shows that index.html was changed.

Create a new image from the running container:
`docker commit httpd custom_image`{{execute}}

Verify that the new image has been created:
`docker images`{{execute}}


The final step is to verify that the image works properly:
`docker run -d --name custom_httpd -p 8080:80 custom_image`{{execute}}

`curl localhost:8080`{{execute}}

```
This is a custom image
```

**Important:** Run `exit`{{execute}} to exit from ssh session with host01.
