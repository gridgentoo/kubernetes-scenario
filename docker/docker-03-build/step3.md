`ADD` and `COPY` instructions are used to add files to the image.

Take a look at our "`Dockerfile.2`":

`cat ~/johnsimage/Dockerfile.2`{{execute}}

    FROM alpine:latest

    RUN adduser -D johndoe
    USER johndoe
    WORKDIR /home/johndoe/

    ADD *.txt ./
    CMD cat *.txt

* The `WORKDIR` instruction sets the working directory to `/home/johndoe/` for instructions that follow it.

* Then the `ADD` instruction copies all `.txt` files in the *build context* to `/home/johndoe/` in the image.

Run `docker build` with the `--file` argument to rebuild using this file:

`docker build -t johnsimage:auto --file ~/johnsimage/Dockerfile.2 ~/johnsimage/`{{execute}}

Now start a container again and see if it works:

`docker run --rm johnsimage:auto`{{execute}}

> Notice how Docker overwrites an image with the same tag.

## .dockerginore

Automatic builds are done by the Docker daemon which sometimes run on a remote host. So before the build starts, Docker has to transfer everything in the context directory (specified in `docker build` command) to the daemon.

To avoid unnecessary data transfer, it is recommended to employ `.dockerignore`.

`echo "lackask.txt" > ~/johnsimage/.dockerignore`{{execute}}

`docker build -t johnsimage:auto --file ~/johnsimage/Dockerfile.2 ~/johnsimage/`{{execute}}

`docker run --rm johnsimage:auto`{{execute}}
