Application we deployed in the previous step from an existing Docker image using OpenShift web console, is only accesible internally using ClusterIP.

In this step, we will make it accessible outside of the OpenShift cluster. To acheive this, we will  expose it using _Route_.

# Route
You can create a new route by clicking _Create Route_ that is displayed to the right of the application name. Click on _Create_ to create route.

![](https://github.com/fenago/katacoda-scenarios/raw/master/learn-openshift/openshift-deploying-applications-using-console/steps/3/route.JPG)


# Protip
You can verify that the application is accesible using route by clicking route url.

![](https://github.com/fenago/katacoda-scenarios/raw/master/learn-openshift/openshift-deploying-applications-using-console/steps/3/access.JPG)