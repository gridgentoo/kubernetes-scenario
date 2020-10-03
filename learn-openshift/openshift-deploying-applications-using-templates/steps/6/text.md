
**Processing a template**
The following is a real-life example of deploying an application from a predefined template using oc new-app command:
`oc new-app jenkins-ephemeral -p JENKINS_SERVICE_NAME=myjenkins`{{execute}}

In the preceding example, we passed the template's name to the command as a parameter; the oc utility can also build an application from the template you specify. The following is the list of objects created by the oc new-app command:
`oc get all`{{execute}}

Clean out your project before we proceed:
`oc delete all --all`{{execute}}

```
deploymentconfig "myjenkins" deleted
route "myjenkins" deleted
pod "myjenkins-1-zg4km" deleted
service "jenkins-jnlp" deleted
service "myjenkins" deleted
```
