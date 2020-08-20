Now we will see how to parameterize our job and use the parameters in a function that is pulled in from GitHub to modify the version on an artifact that we produce.

Start out by adding the empty stage definition for an Assemble stage in our pipeline code. This should come after the Analysis stage but before the closing bracket.

Lines to add are shown in bold below.

Now, we’ll add some parameters to our Jenkins job so we can modify the versions of the war file that we produce if we want.

Click on the General tab or scroll up to the top of the configure page. Check (click on) the box that says “This project is parameterized.”

Click on the Add Parameter button and select String Parameter from the drop-down. Fill in the values as follows:

Name: MAJOR_VERSION
Default Value: 1
Repeat the process to add 3 more String Parameters with the following settings:
Name: MINOR_VERSION
Default Value: 1

Name: PATCH_VERSION
Default Value: $BUILD_NUMBER

Name: BUILD_STAGE
Default Value: SNAPSHOT
 
 

We now have these values and can change them if needed, we want to incorporate them as the version number for the war file that we produce out of this project. We can do that by updating the gradle.properties file in our project with the values.

We can use some shell commands and the tool sed to accomplish this easily. For demonstration purposes,
we’ve put those commands into a function and put that code into a repository on GitHub. 

To see the code, open a new browser tab/window and go to the URL below:

https://github.com/brentlaster/utilities

Then, go into the jenkins/pipeline folder. Click on the updateGradleProperties.groovy file.
 
Notice here that we are using the pipeline DSL step sh as part of our code. Any valid DSL step can be used in such a function.

Next, we’ll add the code in our pipeline stage to bring this in via the fileLoad step. There are a couple of parts to this.

First, we define a variable that points to our project’s workspace in Jenkins. This is so we can make sure to update the gradle.properties file in the correct path.

Next we define a variable to point to the function we load from GitHub. Finally, we invoke the function, passing in references to our parameters.

Add the lines below in bold into the Assemble stage in your pipeline configuration. (For convenience, there is also a file on the desktop named Assemble that you can copy and paste from.)


 
There is one last step for this stage. We need to add a call to Gradle to invoke the assemble task. To get everything ready, we will also call the build task. But we will tell Gradle explicitly to not run the test task (via the
-x switch).

Add the line in bold at the bottom of your task, after the setPropertiesProc call.

Save your changes and click on the Build with Parameters button in the left-hand menu. Note that since we have parameters, we have to tell Jenkins whether we want to use the defaults or enter new values.



If you want to change a value, you can. Just remember for the future stages, always make the values the same or higher for future runs. (i.e. If you change MINOR_VERSION to a 2 now, then set it as a 2 or higher in subsequent runs.)

When you are ready to build, click the Build button.

You should have a successful build with another stage in your pipeline.



You can open up the console log for the most recent build and find the place where the code from github was pulled in.
 
 


If you want to see the version of the war file that was produced, you can go to a terminal window and run the following command (This assumes your workspace is /home/jenkins2/worker_node1/workspace/pipe1. You can find your workspace path near the top of the console log. Look for Running on ..)
sudo ls /home/jenkins2/worker_node1/workspace/pipe1/web/build/libs

The output will show the war file named with the version you specified.


