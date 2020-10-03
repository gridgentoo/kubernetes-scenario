Well, we know about directory structure and want to build and deploy a Redis application from the available Dockerfile. Let's focus on version 4.0. The oc new-app may initiate a build from source code using a sub-directory. We are ready to initiate a simple Dockerfile build:
`oc new-app https://github.com/docker-library/redis.git --context-dir=4.0`{{execute}}


Run `oc status`{{execute}} to view your app.

As we can see, OpenShift created a number of objects such as the following:

- **imagestream** named debian
- **buildconfig** named redis
- **deploymentconfig** named redis
- **service**  named redis

You can run the oc get all command to make sure that all objects have been created:
`oc get all`{{execute}}