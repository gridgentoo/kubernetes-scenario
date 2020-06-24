As we've discussed, it's important to keep the numbers of layers to a minimum.

While the previous techniques are great, and should not be forgotten, another technique is to use a multistage build. This works great for compiled languages, such as golang, .NET, etc.

Open `resources/multistage/Dockerfile` in the editor. Notice that the first part of the file will use the official golang image to compile the application. Afterwards, we start a new image based on an empty container and copy the final executable into the image.

> Using scratch (empty container) is not always possible. Since golang compiles static executables, it does not require other dependencies. Other alternative, light weight, images are alpine and debian:slim.

Now let's build the image: `docker build -t multistage resources/multistage`{{execute}}.

And run a container based on the image: `docker run --rm multistage`{{execute}}.

Before moving on, let's see the impact this has had on the size of the image: `docker images`{{execute}}. You should see something like:

```
$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED              SIZE
multistage          latest              7a242028d4d8        About a minute ago   1.91MB
<none>              <none>              739a7dde7387        About a minute ago   758MB
```

Notice that we have two images that were recently created. The first one, named multistage, is our final image. It has a size of 1.91MB. The one below it is the `builder` image - and it has a size of 758MB.

> The final size of your image will depend on the base image (such as scratch, alpine, debian-slim) as well as the size of your application and its dependencies/resources/etc.
