
Once both the Jenkins and MongoDB pods are running, go back to the Builds | Pipelines sub-menu: 

![Progress](https://github.com/fenago/katacoda-scenarios/raw/master/learn-openshift/openshift-cicd-jenkins/steps/5/start.JPG)


Click the Start Pipeline button. This will trigger a CI/CD pipeline, to start building. Depending on your internet connection, this step will take some time to complete; by the end of it, you should be able to see that two stages were completed successfully:

![Progress](https://github.com/fenago/katacoda-scenarios/raw/master/learn-openshift/openshift-cicd-jenkins/steps/5/complete.JPG)

Clicking on View Log should open a new tab with the Jenkins console output from the Jenkins login page:

![](https://github.com/fenago/katacoda-scenarios/raw/master/learn-openshift/openshift-cicd-jenkins/steps/5/log.JPG)

**Jenkins login page**

Click on Log in with OpenShift and use the same credentials that you used to authenticate in OpenShift (use the developer user, with any password):

![permission](https://github.com/fenago/katacoda-scenarios/raw/master/learn-openshift/openshift-cicd-jenkins/steps/5/permission.JPG)


**Jenkins user authorization**

You will need to authorize the developer user to access Jenkins, by clicking on Allow selected permissions. This will get you to the Jenkins Console Output:


**Jenkins Console Output**
Scroll down to see the complete log, close the lab, and go back to the OpenShift tab.  

We mentioned previously that there is a difference between the Continuous Delivery and Continuous Deployment models; one of them includes human intervention, and the other one does not. 

What we are going to do next is modify our test pipeline and add an approval step. 