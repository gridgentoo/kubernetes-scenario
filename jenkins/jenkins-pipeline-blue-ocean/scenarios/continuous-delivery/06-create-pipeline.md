Like mentioned, [OpenShift Pipelines](https://docs.openshift.com/container-platform/3.7/architecture/core_concepts/builds_and_image_streams.html#pipeline-build) enable creating deployment pipelines using the widely popular **Jenkinsfile** format.

First, deploy a Jenkins server using the provided template and container image that 
comes out-of-the-box with OpenShift:

```
oc new-app jenkins-ephemeral
```{{execute}}

After Jenkins is deployed and is running (verify in web console), then create a 
deployment pipeline by running the following command within the `inventory-widlfly-swarm` folder:

```
oc new-app . \
    --name=inventory-pipeline \
    --strategy=pipeline
```{{execute}}

The above command creates a new build config of type pipeline which is automatically 
configured to fetch the **Jenkinsfile** from the Git repository of the current folder 
(**inventory-wildfly-swarm** Git repository) and execute it on Jenkins.

Click on *Dashboard* to go to the OpenShift Web Console. In the **coolstore** project, 
click on **Builds &rarr; Pipelines** from the left sidebar.

![OpenShift Pipeline](https://katacoda.com/openshift-roadshow/assets/cd-pipeline-inprogress.png)

Pipeline syntax allows creating complex deployment scenarios with the possibility of defining 
checkpoint for manual interaction and approval process using 
[the large set of steps and plugins that Jenkins provide](https://jenkins.io/doc/pipeline/steps/) in 
order to adapt the pipeline to the process used in your team. You can see a few examples of 
advanced pipelines in the 
[OpenShift GitHub Repository](https://github.com/openshift/origin/tree/master/examples/jenkins/pipeline).

In order to update the deployment pipeline, all you need to do is to update the **Jenkinsfile**
in the **inventory-wildfly-swarm** Git repository. OpenShift pipeline automatically executes the 
updated pipeline next time it runs.

You can see the pipeline logs by clicking on **View Log** and then logging into Jenkins using 
your OpenShift credentials and authorizing Jenkins to use your OpenShift credentials.
