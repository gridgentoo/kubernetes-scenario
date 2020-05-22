In our last example, we took a previously created jar and added it to a container, however, we are still missing a step in achieving better idempotency. What built the jar file? We used a Gradle process that used a javac compiler on the operating system all defined in the Katacoda instance. We want our builds to be configurable and predictable as well. 

There are over 30 [continuous integration](https://landscape.cncf.io/category=continuous-integration-delivery&format=card-mode&grouping=category) (CI) systems list in the CNCF landscape. Many of these CI systems embrace using containers as atomic steps in their pipelines. These CI systems is a topic outside the scope of this scenario.

Fortunately, the Docker tooling added the idea of [multi-stage](https://docs.docker.com/develop/develop-images/multistage-build/) building to the Dockerfile definition in version 17.05 (2017-05-04). In earlier versions of the specification, the rule was only one "FROM" command shall appear as the first instruction line in a Dockerfile. However, people started needing temporary containers to be used to build, assemble, and trim artifacts before the final payload is copied to the final container. This is where multi-stage builds come into play. An example is a temporary container than can compile our jar, then a final contain that holds the executable jar artifact.

Consider this definition.

`cat packaging/Dockerfile-multi-stage-jar`{{execute}}

Notice the two FROM statements. The first FROM declares a container that is big and contains a Java compiler. The stage contains has all the dependencies that can compile the should code, run Gradle, and produce the jar file. However, this first container is much too bloated and filled with tools we would never use in production. The second FROM defines the final container and it's the smaller Alpine instance that will simply hold the JRE and jar of the application. The key line is the `COPY --from=builder` that transmits the artifact output of the first _build_ container into the last _Alpine_ container. During the container build, both containers are used, however, the final container image will only include the containers defined in the _last_ FROM stage. Distillation and idempotency achieved.

Build the ListDir application with the multi-stage build.

`docker build \
-f packaging/Dockerfile-multi-stage-jar \
-t $REGISTRY/listdir-c-ms-jar:0.1.0 \
.`{{execute}}

After a few moments a new container is built.

`docker images $REGISTRY/listdir*`{{execute}}

Push it to the private registry.

`docker push $REGISTRY/listdir-c-ms-jar:0.1.0`{{execute}}

Notice the size of the binary container image is the same as the non-multi stage container. We would expect that even though the Dockerfile also has commands for building with the JDK. Remember all the preceding static building stages, except the final FROM stage, are thrown away. The same built image with a Linux OS, a JRE, and our ListDir application can be run.

Let's see how long the execution will take.

`time docker run $REGISTRY/listdir-c-ms-jar:0.1.0`{{execute}}

Run it a few more times and see what the average time is the same as the previous step. The image is not smaller nor does it run faster, but the multi-stage feature will be used in the upcoming steps.
