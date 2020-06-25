We have four instructions in our `Dockerfile`. Does that mean we have four layers in our image?

Run `docker inspect` on the image we just built to find out:

`docker inspect --format='{{range .RootFS.Layers}} {{println . -}} {{end}}' johnsimage:auto`{{execute}}

We have only two layers. Why?

Apparently the first layer is the base image itself. Let's prove that:

`docker inspect --format='{{range .RootFS.Layers}} {{. -}} {{end}}' alpine:latest`{{execute}}

The output should match one of the two layers in our `johnsimage:auto`. That's correct. So what is the other layer?

A layer ID is a hash of the contents stored in the file system. Only when an instructions changes something in the file system (in our case the `RUN`) does a new layer get created. The `USER` and `CMD` only changed the metadata of the image, so they didn't produce any extra layers.

In general, the less layers an image has, the smaller the size will be. Remember the actual data stored in a layer is a diff against its parent. So even if the effect of your `RUN` instruction is to delete a bunch of files, the size of the image increases because there's an extra set of diff to be stored.

One good practice writing a `Dockerfile` is to join multiple `RUN` instructions into one, like:

    RUN apt-get update \
     && apt-get install -y \
        aufs-tools \
        automake \
        build-essential \
     && rm -rf /var/lib/apt/lists/*

[Read more about Dockerfile best practices](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)
