The pipeline that we've defined so far appears to work perfectly. But we haven't tested it with a build that fails. In the following steps, we'll insert a test failure and see what happens to our pipeline.

In Eclipse, go to the Project Explorer and locate the file 'Greeting.java'. It will be under src/main/java in the package 'com.simple'. Open 'Greeting.java'.

Locate the line that reads 'return "GOOD";'. Change it to read 'return "BAD";'

![image](https://user-images.githubusercontent.com/558905/37570728-d9fb5fc4-2ac9-11e8-9a31-f5c11e75d5a3.png)

Save the file.

In the Project Explorer, right-click on Greeting.java and then select Team → Commit... (This is a shortcut for committing a single file).

Enter an appropriate commit message and then click Commit and Push.

![image](https://user-images.githubusercontent.com/558905/37570730-de1bc31e-2ac9-11e8-835c-50a0c9a001ac.png)

Click OK in the results box, to close it.

Switch back to Jenkins.

In a minute or so, you should see a build launched automatically. Jenkins has picked up the change in the 'Git' repository and initiated a build. If nothing happens then click Build Now.

![image](https://user-images.githubusercontent.com/558905/37570732-e312ae46-2ac9-11e8-8901-d68d5f2c94cc.png)

This time, the results are a little different. The 'Maven Build' stage is showing a failure, and the 'Archive Test Results' stage was never executed.
What's happened is that the unit tests have failed, and Maven exited with a non-zero result code because of the failure. As a result, the rest of the pipeline was canceled. This behavior probably isn't what you want or what you expect in most cases. We'd like to go ahead and archive the test results, even when there's a failure. That way, we can see the trend including failed tests.
The solution here is to add a command-line parameter to the Maven invocation. If we add '-Dmaven.test.failure.ignore' to the Maven command line, then Maven will continue with the build even if the tests fail.

Go back to Eclipse and open the 'Jenkinsfile' if necessary.

Alter the 'bat "mvn..." line to read as follows:

`bat 'mvn -Dmaven.test.failure.ignore install'`{{execute}}

Save the 'Jenkinsfile'. Commit and push the changes using the same technique as above.

After a minute or so, you should see a new Pipeline instance launched. If nothing happens then click Build Now.

![image](https://user-images.githubusercontent.com/558905/37570742-ec03d1e2-2ac9-11e8-8858-d5854d35b8a6.png)

This time, the pipeline runs to completion, and the test results are archived as expected. Notice that the build is now flagged as 'unstable' (indicated by the yellow color and the icon). The JUnit archiver noticed the failures and flagged the build unstable, even though Maven exited normally.
