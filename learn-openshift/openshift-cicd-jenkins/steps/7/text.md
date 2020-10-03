
Adding one more stage called approval triggers the second build to start, and eventually you should be able to see the new approval stage, with Input Required:


![](https://github.com/fenago/katacoda-scenarios/raw/master/learn-openshift/openshift-cicd-jenkins/steps/7/input.JPG)
 

Clicking on Input Required will open a new tab and redirect you to the Jenkins approval stage, asking: Approve moving to deploy stage? Shown as follows:

![](https://github.com/fenago/katacoda-scenarios/raw/master/learn-openshift/openshift-cicd-jenkins/steps/7/approve.JPG)

The result will be different depending on what you answer. In our case, we are going to press the Proceed button. This will redirect us to the Jenkins Console Output, but we can just close it and go back to the OpenShift pipeline tab. From the following screenshot, we can see that the CI/CD pipeline has completed the deploy stage and now we have three stages instead of two as in Build #1.


As a result, you should see a nodejs-mongodb-example, #2 pod running in the Overview menu. The #2 means that it is build number two:

![](https://github.com/fenago/katacoda-scenarios/raw/master/learn-openshift/openshift-cicd-jenkins/steps/7/build.JPG)

Jenkins is a lot more complicated than that, but this should have provided you with a good overview of CI/CD in OpenShift, and how easy it is to get started with Jenkins in OpenShift