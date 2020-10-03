The last method of creating image streams we will discuss is pushing images directly into the OpenShift internal registry.

 
Log in as alice unprivileged account, if you haven't already done so:
`oc login -u alice`{{execute}}

Then, run the following command to login to the internal registry:
`docker login -u $(oc whoami) -p $(oc whoami -t) [[HOST_IP]]:5000`{{execute}}

In the preceding command, we used a bash feature called command expansion, which allowed us to supply the login command with the username, password/token, and registry IP:port, from left to right. You can run all these commands (oc whoami and oc whoami -t) separately to see what output they provide.

Now that we are authenticated in the internal registry, we can push images into it directly, as if it were a general Docker registry. Let's see what we have in our OpenShift internal registry:
`docker images`{{execute}}

Let's delete the Lighttpd image left over from the previous exercise:
`docker rmi cd7b7073c0fc`{{execute}}

Now use the same Lighttpd image, as in the previous subsection:
`docker pull gists/lighttpd`{{execute}}

Tag it with the registry's address and port included in the tag:
`docker tag docker.io/gists/lighttpd [[HOST_IP]]:5000/advanced/lighttpd`{{execute}}

**Note:** We used the name of the project to create the image stream as part of the path to the image in the registry because the token we used grants developer user permission to create image streams in the myproject project only. OpenShift expects us to find images in particular locations so that it can create image streams from images.

Let's see if the image with both tags referencing it is there:
`docker images`{{execute}}

Finally, we need to push the image into the repository:
`docker push [[HOST_IP]]:5000/advanced/lighttpd`{{execute}}

The push refers to a repository [[[HOST_IP]]:5000/advanced/lighttpd]

Now verify that the lighttpd image stream was created in OpenShift:
`oc get is`{{execute}}

```
NAME     DOCKER REPO                                        TAGS   UPDATED
lighttpd [[HOST_IP]]:5000/advanced/lighttpd latest 15 minutes ago
```

As expected, the image stream was created.

Just as before, we need to delete everything before going on to the next section:
`oc delete is/lighttpd`{{execute}}