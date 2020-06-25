(From Docker documentation)

> A `Dockerfile` is a text document that contains all the commands a user could call on the command line to assemble an image.
> Using `docker build` users can create an automated build that executes several command-line instructions in succession.

Let's take a look at our first `Dockerfile`:

`cat ~/johnsimage/Dockerfile`{{execute}}

    FROM alpine:latest

    RUN adduser -D johndoe
    USER johndoe

    CMD echo "Hello from John's image!"`

* A `Dockerfile` always starts with a `FROM` instruction, which specifies the *base image* to use. In this example we stick to `alpine:latest`.

* The instruction `RUN` tells Docker to execute a command, for instance, to create a user `johndoe`.

* `USER` tells Docker the user to run as when a container is created from this image.

* Finally, `CMD` specifies the default command to run when a container is created. It can be overridden by appending to the end of the `docker run` command, which you have already seen in previous scenarios.

Run `docker build -t johnsimage:auto ~/johnsimage/`{{execute}} to build an image called `johnsimage:auto`. The path at the end of the command line is the *build context*. Docker will by default look for a file named "`Dockerfile`" in that path.

As you can see from the output, Docker starts a temporary container (`---> Running in <container-id>`) for each instruction in the `Dockerfile`, execute the instruction, and commit it as a temporary image (`---> <image-id>` below each `Running in`).

These temporary images are visible via `docker images -a`{{execute}}

Now try start a container from this image:

`docker run --rm johnsimage:auto`{{execute}}

`docker run --rm johnsimage:auto whoami`{{execute}}

`docker run --rm -u nobody johnsimage:auto whoami`{{execute}}

`docker run --rm johnsimage:auto echo "Hej hej."`{{execute}}

[Read more about Dockerfile](https://docs.docker.com/engine/reference/builder/)

[Read more about docker build](https://docs.docker.com/engine/reference/commandline/build/)
