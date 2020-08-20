This exercise show how to use Checkstyle for improving the style of Java code. First, we will add Checkstyle to Gradle in order to create XML reports for a single build. Jenkins allows us to visualize the results of more than one test/build run into historic reports. After that, we will show, how a developer can use the Eclipse Checkstyle plugin in order to create better code:

![2017-02-01-04_43_16-github-triggered-build-jenkins](https://user-images.githubusercontent.com/558905/38051154-7241f828-329b-11e8-9732-48d15d74027d.png)

A typical workflow is visualized above: a developer checks in the code changes into the repository. Jenkins will detect the change, build (compile) the software, test it and prepare to deploy it on a system. 

Depending on the configuration, the deployment is triggered by a human person, or automatically performed by Jenkins.
