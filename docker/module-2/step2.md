## Available instructions

The full list of Dockerfile instructions can be found at https://docs.docker.com/engine/reference/builder/.

Each instruction in your Dockerfile will generate a new layer.

Here's a summary of the commonly used instructions:

### `FROM`

The `FROM` instruction defines the base image from which our image will extend.

Example: `FROM alpine:3.9`

### `WORKDIR`

The `WORKDIR` instruction will change the working directory for subsequent instructions. This is similar to running `cd` on the command line.

### `COPY`

The `COPY` instruction will copy files into the docker image.

Example: `COPY index.html /usr/share/nginx/html/index.html`

### `RUN`

The `RUN` instruction will execute commands in your Docker image.

Example: `RUN touch somefile.txt`

### `EXPOSE`

The `EXPOSE` instructions indicates that the Docker container will listen on a given port.

Example: `EXPOSE 80` or `EXPOSE 80/tcp`

### `ENV`

The `ENV` instruction defines environment variables that will be used by subsequent instrutions when building the image and by the final running container. Their values can be modified when creating a container: `docker run --env <key>=<value>`.

Example: `ENV SOME_ENV_VAR default_value`

### `ENTRYPOINT`

The `ENTRYPOINT` instruction configures the container to run as an executable. This command will run by default (through `docker run`).

Example: `ENTRYPOINT [ "/entrypoint.sh" ]`

## Considerations

It's important to keep the number of layers in your final Docker image to a minimum. This will reduce the complexity of your image and reduce the final image size.

Some common techniques to reduce the number of layers:

- Run multiple commands in your `RUN` instructions by appending them together with `&&`.

  For example: `RUN wget -O sometar.tgz && tar -xf sometar.gz -C /usr/local && rm sometar.tgz`
- Remove temporary files in each stage. For example, we removed the `sometar.tgz` in the previous suggestion at the end of the `RUN` instruction.
- Use a multi-stage build (described in the next step)


## Practice

Based on the information we just learnt, let's make our own Dockerfile. Open `resources/buildyourown/Dockerfile` in the editor, and write the instructions below each comment.

When you're ready to build your image, run `docker build -t buildyourown resources/buildyourown`{{execute}}. If it works, awesome! If it doesn't work, read the error message and try again.

Now let's run a container based on the new image:

1. `docker run --rm buildyourown`{{execute}}
2. `docker run --rm --env WHO=Canada buildyourown`{{execute}}

> Notice if you change one of the later layers that Docker will reuse the layers before it and not rebuild them. This will help speed up your image builds if you're constantly rebuilding.
