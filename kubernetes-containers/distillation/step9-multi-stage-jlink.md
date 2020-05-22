Consider this definition.

`cat packaging/Dockerfile-multi-stage-jlink`{{execute}}

Notice the two FROM statements. The first FROM declares a container that is big and contains a Java compiler. The stage contains has all the dependencies that can compile the should code, run Gradle, and produce the jar file. However, this first container is much too bloated and filled with tools we would never use in production. The second FROM defines the final container and it's the smaller Alpine instance that will simply hold the JRE and jar of the application. The key line is the `COPY --from=builder` that transmits the artifact output of the first _build_ container into the last _Alpine_ container. During the container build, both containers are used, however, the final container image will only include the containers defined in the _last_ FROM stage. Distillation and idempotency achieved.

Before we can build with JLink we need to define a default module for the ListDir project. There is already one defined, we just need to enable it in the project. Once enabled, you will not be able to compile the project with a Java version less than Java 9.

`mv src/main/java/module-info.java.disabled src/main/java/module-info.java`{{execute}}

Build the ListDir application with the multi-stage build.

`docker build \
-f packaging/Dockerfile-multi-stage-jlink \
-t $REGISTRY/listdir-d-ms-jlink:0.1.0 \
.`{{execute}}

After a few moments a new container is built.

`docker images $REGISTRY/listdir*`{{execute}}

Push it to the private registry.

`docker push $REGISTRY/listdir-d-ms-jlink:0.1.0`{{execute}}

Notice the size of the binary container image is now 39MB. Alpine is about 4.5MB, which means our app payload with the JRE is about 34MB.

Let's see how long the execution will take.

`time docker run $REGISTRY/listdir-d-ms-jlink:0.1.0`{{execute}}

The execution time is roughly the same and we have achieved a further distillation step with JLink.

## Inspect Container ##

You can inspect any of these build containers with the following shell `sh` command.

`docker run -it $REGISTRY/listdir-d-ms-jlink:0.1.0 sh`{{execute}}

The prompt will change to a pound sign (#) indicating you are now inside the container.

Notice in the current directory is listdir.jar.

`ls -l`{{execute}}

Notice the Java runtime is alive and well. Remember that _this is the JRE created by Jlink_!

When you are done inspecting the container exit the shell with the `exit` command. Be sure not to type it twice else you could accidentally exit from your Katacoda instance.

Can we distill any more water out of this stone? Of course, let's look at compiling the Java application to native binaries with GraalVM in the next step.
