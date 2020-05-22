Consider this definition.

`cat packaging/Dockerfile-multi-stage-quarkus`{{execute}}

TODO ... explain [Quarkus](https://quarkus.io/)

Build the ListDir application with the multi-stage build.

`docker build \
-f packaging/Dockerfile-multi-stage-quarkus \
-t $REGISTRY/listdir-e-ms-quarkus:0.1.0 \
.`{{execute}}

This may take a few minutes, but once complete a new container is built.

`docker images $REGISTRY/listdir*`{{execute}}

Push it to the private registry.

`docker push $REGISTRY/listdir-e-ms-quarkus:0.1.0`{{execute}}

Notice the size of the binary container image is now (TODO ?!!))MB. Alpine is about 4.5MB, which means our app payload with the JRE is about (TODO ?!)MB.

Let's see how long the execution will take.

`time docker run $REGISTRY/listdir-e-ms-quarkus:0.1.0`{{execute}}

The execution time is roughly the same. We have achieve a further distillation step with Quarkus and Graal.

## Inspect Container ##

You can inspect any of these build containers with the following shell entry command.

`docker run -it $REGISTRY/listdir-e-ms-quarkus:0.1.0 sh`{{execute}}

The prompt will change to a pound sign (#) indicating you are now inside the container.

Notice in the current directory is listdir.jar.

`ls -l`{{execute}}

Notice the Java runtime is alive and well. Remember that _this is the JRE created by Jlink_!

When you are done inspecting the container exit the shell with the `exit` command. Be sure not to type it twice else you could accidentally exit from your Katacoda instance.

## Debugging the build container ##

TODO - describe why

`docker run -it -v $(pwd):/home/quarkus/listdir quay.io/quarkus/ubi-quarkus-native-s2i:19.2.0.1 sh`{{execute}}

There is much more you can do with GraalVM and its associated projects at Quarkus, Micronaut and TODO.