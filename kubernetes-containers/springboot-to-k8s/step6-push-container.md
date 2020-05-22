Build the container. The build command assumes there is a Dockerfile in the current directory. Notice that Gradle is run inside the building stage.

`docker build -t $REGISTRY/hello .`{{execute}}

Verify the container image has been produced.

`docker images "*/hello"`{{execute}}

Push this container image to the private registry on Kubernetes that was installed in step 2.

`docker push $REGISTRY/hello`{{execute}}

Inspect the contents of the registry now listing the container image that was just built, tagged, and pushed.

`curl $REGISTRY/v2/_catalog`{{execute}}
