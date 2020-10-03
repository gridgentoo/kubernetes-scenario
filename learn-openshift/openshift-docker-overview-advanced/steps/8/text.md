The docker commit command is difficult to automate. Luckily, Docker can build images automatically by reading instructions from a special file usually called a Dockerfile. A Dockerfile is a text document that contains all the commands a user can call on the command line to assemble an image.

A Dockerfile has a number of instructions that help Docker to build an image according to your requirements. Here is a Dockerfile example, which allows us to achieve the same result as in the previous section:

<pre class="file" data-filename="Dockerfile" data-target="replace">
FROM httpd
RUN echo "This is a custom image" > /usr/local/apache2/htdocs/index.html
</pre>

Once this Dockerfile is created, we can build a custom image using the docker build command:
`docker build -t custom_image2 .`{{execute}}

```
Sending build context to Docker daemon 2.048 kB
Step 1 : FROM httpd
 ---> 01154c38b473
Step 2 : RUN echo "This is a custom image" > /usr/local/apache2/htdocs/index.html
 ---> Using cache
 ---> 6b9be8efcb3a
Successfully built 6b9be8efcb3a
```

**Note:** Please note that the . at the end of the first line is important as it specifies the working directory. Alternatively, you can use ./ or even $(pwd).

`docker images`{{execute}}

We can check the history of image modifications using docker history:
`docker history custom_image2`{{execute}}

Note that a new layer is added. This is where we change the content of the index.html file in comparison to the original httpd image.