Consider this definition.

`cat packaging/Dockerfile-multi-stage-native`{{execute}}

Notice in the first stage the new command-line tool called `native-image`. This powerful tool takes compiled java and links it to a binary executable form native to run on the operating system. The Operating system is defined where native-image runs.

This tool is part of the GraalVM from Oracle. GraalVM offers a comprehensive ecosystem supporting a large set of languages (Java and other JVM-based languages, JavaScript, Ruby, Python, R, and C/C++ and other LLVM-based languages) and running them in different deployment scenarios (OpenJDK, Node.js, Oracle Database, or standalone).

For Java applications it has these distillation benefits:

- Run Java faster
- Faster container start times, significantly
- Smaller containers
- **Creates native executables**
- Foundation for microservices frameworks [Helidon](https://helidon.io/), [Micronaut](https://micronaut.io/), and [Quarkus](https://quarkus.io/)

GraalVM is a rich ecosystem and we should expect this to grow as more of our applications move to microservices and containers.

Build the ListDir application with the multi-stage build.

`docker build \
-f packaging/Dockerfile-multi-stage-native \
-t $REGISTRY/listdir-e-ms-native:0.1.0 \
.`{{execute}}

This may take a few minutes, but once complete a new container is built.

`docker images $REGISTRY/listdir*`{{execute}}

Push it to the private registry.

`docker push $REGISTRY/listdir-e-ms-native:0.1.0`{{execute}}

Did you see how fast that push was?

Notice the size of the binary container image is now down to just 25MB. Base Alpine is about 5MB, but we need a special version that adds glibc instead of relying on the base Alpine's musl libc. Some claim that this is strange, but it works. The [frolvlad/alpine-glibc](https://github.com/Docker-Hub-frolvlad/docker-alpine-glibc) container is ~17MB. All this means our **Java application linked to binary form, is ~8.5MB**. There is no JRE here, not in the Alpine image and not in the binary.

Let's see how long the execution will take.

`time docker run $REGISTRY/listdir-e-ms-native:0.1.0`{{execute}}

The execution time is slightly faster. We have achieved a further distillation step with GraalVM and its native-image tool.

## Inspect Container ##

You can inspect the container with this shell (sh) command.

`docker run -it $REGISTRY/listdir-e-ms-native:0.1.0 sh`{{execute}}

The prompt will change to a pound sign (#) indicating you are now inside the container.

Notice in the current directory is `/work` and there the binary application resides.

`pwd && ls -l`{{execute}}

Thanks to GraalVM, Java can be targeted to these small and efficient packages.

When you are done inspecting the container exit the shell with the `exit` command. Be sure not to type exit twice else you could accidentally exit from your Katacoda instance.
