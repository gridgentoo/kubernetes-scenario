In this step, we will learn OpenShift CLI using the command _oc_.

Before we begin, make sure that your OpenShift is up and running. Run the folowing command to login to the OpenShift cluster
`oc login -u system:admin`{{execute}}


Next, create a dedicated project for our lab:
`oc new-project advanced`{{execute}}

#### Templates
Instead of creating resources one-by-one – for example, a pod, service, and route – templates allow you to create multiple objects at once with a single CLI command. More than that —they may include parameters that can be optional,or default to values either static or generated in accordance with specific rules.

In a sense, they are similar to Docker Compose or OpenStack Heat—all of these provide the facility to create entire application stacks from the ground up. With templates, the cluster administrator can provide developers with the ability to deploy multi-tier applications with all dependent services.