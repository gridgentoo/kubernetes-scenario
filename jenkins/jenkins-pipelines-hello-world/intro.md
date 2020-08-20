<img style="float: left; padding:5px 20px 5px 10px" src="https://user-images.githubusercontent.com/21102559/39315185-0d9230fe-4944-11e8-9660-0d23401d30ca.png">

In this scenario you'll dog into an increasingly popular Jenkins plugin named [Pipeline](https://wiki.jenkins-ci.org/display/JENKINS/Pipeline+Plugin), an increasingly popular plugin that helps defining versatile Jenkins workflows as Groovy code.

Traditionally, Jenkins is administered by a graphical Web interface. Now, the Pipeline plugin allows teams and DevOps to manage workflow definitions within source control, giving them the ability to clone, change, review and iterate upon the continuous delivery pipeline. Moreover, the plugin offers teams a nice interface to view the stages of each workflow, like follows:

![2017-05-22-22_50_50-2017-05-22-22_12_25-pipeline-hello-world](https://user-images.githubusercontent.com/558905/38009674-8702c882-3223-11e8-8eab-f0d1739ddf7c.png)

----

### Whats so Cool About the Jenkins Pipeline Plugin?

The popularity of the Pipeline plugin can be seen in its usage chart:

![2017-05-20-23_38_04-pipeline-plugin-jenkins-jenkins-wiki](https://user-images.githubusercontent.com/558905/38009684-8794bc2e-3223-11e8-8fa7-98c13993d5ec.png)

The number one reason is that admins or developers can put the workflow under source control. Another reason is that the workflows can be organized in stages, whose results can be observed in the nice graphical interface seen above. However, the Pipeline plugin has more advantages than that:

* Code: Pipeline users can put workflows under source control (e.g. git), so they can add edit, review and
* Durable: a Task that is interrupted by a planned or unplanned restart of the server is handled gracefully by the Durable Task Plugin included in the Pipeline Plugin
* Interactive/Pausable: manual steps can be added to pipeline workflows
* Versatile: you can create complex workflows including workflow forks and joins
* Extensible: Pipeline users can create and add custom extension to the Pipeline domain specific language (DSL)

Enough theory for now. Now let's get some hands-on experience.

The scenario is designed to demostrate how you can use Groovy Pipelines within a Continuous Intagration/Delivery (CI/CD) workflow to download software code from [GitHub](https://github.com/), perform unit tests and display a historical test result report.

You will learn how to make use of a Docker host environment for running Jenkins in a Docker container. The steps guide you to installing the required plugins, creating and running a Software build process build and viewing the test report results.

For a more verbose introduction into the [Pipeline plugin](https://wiki.jenkins-ci.org/display/JENKINS/Pipeline+Plugin), see [this blog](http://wp.me/p6C5gC-NZ).
