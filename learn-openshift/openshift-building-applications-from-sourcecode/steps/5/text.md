Now that we know that the phpinfo application works as expected, let's focus on the low-level details that are required to understand the build process. OpenShift created a number of API resources to make the build possible. Some of them are related to the deployment process, which we learned about in previous chapters. We can display all entities as follows:


`oc get all`{{execute}}


Most of the entities (the pod, service, replication controller, and deployment configuration) in the preceding output are already familiar to you, from previous chapters. 

The S2I build strategy uses the following additional entities—build configuration, build, and image stream. The build config has all of the information necessary to build the application. As with the rest of the OpenShift API resources, its configuration can be gathered using the oc get command:


`oc get bc phpinfo -o yaml`{{execute}}

The following fields are especially important:

spec.source.git: Repository URL for the application source code
spec.strategy.sourceStrategy: Contains information on which builder will be used.
In our case, OpenShift uses a built-in builder from image stream php:7.0, in the openshift namespace. Let's look at its configuration:


`oc get is php -o yaml -n openshift`{{execute}}

The PHP builder image used to build our application is centos/php-70-centos7:latest.