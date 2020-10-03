Go back to the pipeline sub-menu:

![edit](https://github.com/fenago/katacoda-scenarios/raw/master/learn-openshift/openshift-cicd-jenkins/steps/6/main.JPG)

Clicking on Edit Pipeline should redirect us to editing our first pipeline.

![edit](https://github.com/fenago/katacoda-scenarios/raw/master/learn-openshift/openshift-cicd-jenkins/steps/6/edit.JPG)


#### Editing pipelines

**Note:**
Jenkins uses the Apache Groovy Programming Language. It is pretty easy to learn, and we are not going to delve too deeply into the details; rather, we will give you some basic skills. You can find more information regarding Groovy in the Further reading section.

We simply need to add a new stage with an arbitrary name; let's call it the approval stage, in between the build and deploy stages. This new approval stage will put the deployment stage on hold, until you manually approve it. Let's add following highlighed lines in the `JenkinsFile`:

```
Copy
...
node('nodejs') {
 stage('build') {
 openshiftBuild(buildConfig: 'nodejs-mongodb-example', showBuildLogs: 'true')
 }
 **stage('approval') {**
 **input "Approve moving to deploy stage?"**
 **}**
 stage('deploy') {
 openshiftDeploy(deploymentConfig: 'nodejs-mongodb-example')
 }
}
...
```

Click on Save and start the pipeline. 
