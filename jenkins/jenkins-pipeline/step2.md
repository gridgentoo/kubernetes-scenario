For simple pipelines or experimentation, it's convenient to define the pipeline script in the web interface. But one of the common themes of modern software development is "If it isn't in version control, it didn't happen". The pipeline definition is no different, especially as you build more and more complex pipelines.

You can define the pipeline in a special file that is checked out from version control. There are several advantages to doing this. First, of course, is that the script is version- controlled. Second, we can edit the script with the editor or IDE of our choice before checking it in to version control. In addition, we can employ the same kind of "SCM Polling" that we would use in a more traditional Jenkins job.
In the following steps, we'll create a Jenkinsfile and create a pipeline job that uses it.

Open the Eclipse editor. If this lab is completed in the normal sequence, you should have the 'SimpleGreeting' project already in Eclipse's workspace. If not, check out the project from version control (consult your instructor for directions if necessary).

In the Project Explorer, right-click on the root node of the SimpleGreeting project, and then select New → File.

Enter 'Jenkinsfile' as the file name

![image](https://user-images.githubusercontent.com/558905/37570714-b6c448c2-2ac9-11e8-8703-9ba728eb6127.png)

Click Finish to create the new file.

Enter the following text into the new file (Note: this is the same script that we used above, so you could copy/paste it from the Jenkins Web UI if you want to avoid some typing):

```
node {
  stage 'Checkout'
  git url: 'C:\\Software\\repos\\SimpleGreeting.git'

  stage 'Maven build' bat 'mvn install'

  stage 'Archive Test Results' step([$class: 'JUnitResultArchiver',
  testResults: '**/target/surefire-reports/TEST-*.xml'])
}
```

Save the Jenkinsfile by selecting File → Save from the main menu, or by hitting Ctrl-S.

In the Project Explorer, right-click on the SimpleGreeting node, and then select Team → Commit...

Eclipse will display the Commit Changes dialog. Click the checkbox next to Jenkinsfile (to include that file in the commit) and enter a commit message.

![image](https://user-images.githubusercontent.com/558905/37570719-bf54b8b4-2ac9-11e8-89eb-b90bae914cc9.png)

Click Commit and Push, and then click OK to dismiss the status dialog.

Now we have a Jenkinsfile in our project, to define the pipeline. Next, we need to create a Jenkins job to use that pipeline.

In the Jenkins user interface, navigate to the root page, and then click on New Item.

Enter 'SimpleGreetingPipelineFromGit' as the name of the new item, and select Pipeline as the item type.

![image](https://user-images.githubusercontent.com/558905/37570721-c3990448-2ac9-11e8-8559-7c9362135d2d.png)

Click OK to create the new item.

Scroll down to the Build Triggers section.

Click on Poll SCM and enter '* * * * ' as the polling schedule. This entry will cause Jenkins to poll once per minute.

![image](https://user-images.githubusercontent.com/558905/37570722-c933ce10-2ac9-11e8-80c7-ffc4d027389e.png)

Scroll down to the Pipeline section, and change the Definition entry to 'Pipeline Script from SCM'

Enter the following:

SCM:	Git

Repository URL:	C:\Software\repos\SimpleGreeting.git

The Pipeline section should look similar to:

![image](https://user-images.githubusercontent.com/558905/37570725-cdc509f8-2ac9-11e8-96f7-4fde9f04c36b.png)

Click Save to save the new configuration.

Click Build Now to launch the pipeline.

You should see the pipeline execute, similar to the previous section.
