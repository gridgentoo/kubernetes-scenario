What we need is more control of the environment in which our applications will be developed, tested, and deploy upon. This environmental control is called infrastructure-as-code. This is a major contributor to widening the adoption of using containers in our industry. As developers of business solutions, we now have more control of the stack our applications depend upon. This increased power to control [idempotence](https://en.wikipedia.org/wiki/Idempotence) means we say less often, "Not sure what your problem is, works on my machine."

In the previous step, we ran the ListDir app on some underlying operating system and Java runtime engine provided by this Katacoda instance. Let's instead define our idempotent machine stack. In the same source directory, there is a packaging directory with a Dockerfile.

`cat packaging/Dockerfile-single-stage-slim`{{execute}}

Notice the Dockerfile specifies the exact version of Linux and the JRE we wish to use. Once those have been defined our application is also added into the container. Let's build a container image using this definition.

`docker build \
-f packaging/Dockerfile-single-stage-slim \
-t $REGISTRY/listdir-a-sss:0.1.0 \
.`{{execute}}

After a few moments a new container is built.

`docker images $REGISTRY/listdir*`{{execute}}

Push it to the private registry.

`docker push $REGISTRY/listdir-a-sss:0.1.0`{{execute}}

Notice the size of the binary container image is about 184MB. This built image includes a Linux OS, a JRE, and our ListDir application. The "slim" version is a derivation of Debian Linux that is smaller than the full Debian image. A good example of the distillation pattern.

Let's see how long the execution will take.

`time docker run $REGISTRY/listdir-a-sss:0.1.0`{{execute}}

Run it a few more times and watch the average time and variance. It should take about 1 second, +/- 1/3 of a second.

Compare this time to running the application natively. It adds some latency to get the application to start. This is the cost of starting the container. However, we now have much more control over the environment including the OS and the JRE version.
