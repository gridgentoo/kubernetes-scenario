Despite the name "slim" for the base of the previous container we can do better to reduce the image size. Containers derived from _Alpine_ are much smaller than then slim bases. Let's switch to use Alpine an see the image size difference.

`cat packaging/Dockerfile-single-stage-alpine`{{execute}}

Build a container using this definition.

`docker build \
-f packaging/Dockerfile-single-stage-alpine \
-t $REGISTRY/listdir-b-ssa:0.1.0 \
.`{{execute}}

After a few moments a new container is built.

`docker images $REGISTRY/listdir*`{{execute}}

Push it to the private registry.

`docker push $REGISTRY/listdir-b-ssa:0.1.0`{{execute}}

Notice the size of the binary container image is about 85MB. This built image still includes a Linux OS, a JRE, and our ListDir application. However,the image size is distilled by near 100MB! Let's see how long the execution will take.

`time docker run $REGISTRY/listdir-b-ssa:0.1.0`{{execute}}

Run it a few more times and see what the average time and variance is. It should take about 1 second, +/- 1/3 of a second. This is roughly the same startup and execution time as the previous slim container. Smaller image, yet works just fine.

There are other Linux variants and you can also create your own, but [Alpine](https://en.wikipedia.org/wiki/Alpine_Linux) has emerged as being one of the common base containers to use because it follows many best practices of the distillation pattern. Alpine promotes its virtues as [small, simple, and secure](https://alpinelinux.org/about/).

But there is more with can do with the distillation pattern related to idempotence.
