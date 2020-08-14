We can create a pipeline job that includes the pipeline script in the job configuration, or the pipeline script can be put into a 'Jenkinsfile' that's checked-in to version control.

To get a taste of the pipeline, we'll start off with a very simple pipeline defined in the job configuration.

>Note: We need to have a project in source control to check-out and build. For this example, we're using the 'SimpleGreeting' project that we previously cloned to a 'Git' repository at 'C:\Software\repos\SimpleGreeting.git'

Go to the Jenkins console (Dashboard to right):

http://localhost:8080

Click on the New Item link.

![image](https://user-images.githubusercontent.com/558905/37570706-8e719db6-2ac9-11e8-932c-e7f3ad0a04e8.png)

Enter 'SimpleGreetingPipeline' as the new item name, and select 'Pipeline' as the item type.

![image](https://user-images.githubusercontent.com/558905/37570708-9b6b9a1c-2ac9-11e8-86bb-70df3e5655c8.png)

When the input looks as above, click on OK to create the new item.

Scroll down to the Pipeline section and enter the following in the Script text window.

```
node {
  stage 'Checkout'
  git url: 'C:\\Software\\repos\\SimpleGreeting.git'

  stage 'Maven build' bat 'mvn install'

  stage 'Archive Test Results' step([$class: 'JUnitResultArchiver',
  testResults: '**/target/surefire-reports/TEST-*.xml'])
}
```

This pipeline is divided into three stages. First, we checkout the project from our 'git' repository. Then we use the 'bat' command to run 'mvn install' as a Windows batch file. Finally, we use the 'step' command to utilize a step from a standard Jenkins plugin - in this case, the JUnitResultArchiver, to save and display the results of the unit tests.
All of the above is wrapped inside the 'node' command, to indicate that we want to run these commands in the context of a workspace running on one of Jenkins execution agents (or the master node if no agents are available).

Click on Save to save the changes and return to the project page.

Now, click on Build Now to startup a pipeline instance:

![image](https://user-images.githubusercontent.com/558905/37570712-a3423f3e-2ac9-11e8-9989-e1644e2003b5.png)

After a few moments, you should see the Stage View appear, and successive stages will appear as the build proceeds, until all three stages are completed:

![image](https://user-images.githubusercontent.com/558905/37570713-a7bff89e-2ac9-11e8-86e0-630e5b66beba.png)
