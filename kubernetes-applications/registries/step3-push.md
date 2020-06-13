With the new registry running, let's push a container to it. Grab an existing container.

`docker pull replicated/dockerfilelint`{{execute}}

Verify the image is now cached locally.

`docker images | grep lint`{{execute}}

Add a new tag to the new container.

`docker tag replicated/dockerfilelint $REGISTRY/dockerfilelint`{{execute}}

With the image pulled and with a new tag, it now can be deployed to the new registry.

`docker push $REGISTRY/dockerfilelint`{{execute}}

Inspect the contents of the private registry and verify the container has been pushed.

`curl $REGISTRY/v2/_catalog`{{execute}}
