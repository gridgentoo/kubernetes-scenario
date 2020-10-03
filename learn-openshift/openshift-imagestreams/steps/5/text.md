
Another way to create an image stream is to use the new-app command to create an application from a ready-to-use Docker image:

`oc new-app gists/lighttpd`{{execute}}

**Note:** Lighttpd is yet another web server, like Nginx or Apache. We used it in this example, because both Nginx and Apache image streams are supplied with OpenShift out-of-the-box.

This creates a number of resources, one of which is an image stream.

If you describe the newly created deployment config, you will see that it actually references the image stream, not the image itself:
`oc describe dc/lighttpd`{{execute}}

In the preceding example, DeploymentConfig references a Lighttpd server image in the image stream according to the following scheme:

```
gists/lighttpd: Image stream name
sha256: Indicates that the image identifier is generated using the SHA256 hash algorithm
23c7c16d3c294e6595832dccc95c49ed56a5b34e03c8905b6db6fb8d66b8d950: The image hash/ID itself
```
This is how deployment configs and replication controllers usually reference images in OpenShift.

Again, let's clean up the environment:
`oc delete all --all`{{execute}}