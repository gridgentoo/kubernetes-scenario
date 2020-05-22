TODO - Drafting...

The Docker tooling has made building, running and managing containers relatively easy. With the standardization of the container image format, [OCI](https://en.wikipedia.org/wiki/Open_Container_Initiative), other tools have emerged offering advantages beyond the Docker tools.

Tools such as:
- BuildKit
- Img 
- Buildah/Podman
- Kaniko
- Bazel
- there are more...

The advantages of these tools is beyond this scenario. However one might consider some of these tools might help us with the distillation pattern by making the image smaller and perhaps even more secure.

We will build a new container using [Kaniko](https://github.com/GoogleContainerTools/kaniko) and observe the size difference. If there is any.

`docker run -ti --rm -v $(pwd):/workspace \
gcr.io/kaniko-project/executor:latest \
--dockerfile=packaging/Dockerfile-single-stage-slim \
--destination=$REGISTRY/listdir-d-kaniko:0.1.0 \
--insecure --skip-tls-verify`{{execute}}

After a few moments a new container is built.

`docker images $REGISTRY/listdir*`{{execute}}

TODO - comment about size, has Kaniko made it smaller?

Let's see how long the execution will take.

`time docker run $REGISTRY/listdir-c-ms:0.1.0`{{execute}}

TODO - comment about execution time.

TODO - Conclusion about Kaniko and perhaps others
