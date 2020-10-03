OpenShift leverages the Jenkins CI/CD model, and extends it by using a combination of the following components:

**OpenShift Domain Specific Language (DSL):** DSL is provided by the OpenShift Jenkins client plugin that runs on the Jenkins Master pod and interacts with the OpenShift API server. The OpenShift DSL provides a method for controlling your application life cycle.

**Jenkins Pipeline Build Strategy:** Similar to other OpenShift build strategies, it defines the build's workflow. Jenkins Pipeline Build Strategy allows a developer to create a Jenkins pipeline that is monitored and controlled by OpenShift.   

**Jenkinsfile:** Defines CI/CD pipelines through a series of steps during application deployment in OpenShift, using the Apache Groovy programming language.