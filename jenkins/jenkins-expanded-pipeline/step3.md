In this section, we’ll add in some testing stages to our pipeline. We’ll also see how to run items in parallel.

In the previous Compile stage, we specifically told Gradle not to run the unit tests that it found by specifying the
“-x test” target. Now we want to add in processing of several unit tests. Additionally, we want to run these in
parallel. First, create a new stage for the unit testing. Also go ahead and create a stage for the integration testing.

If still in the Stage View, click Configure in the upper left menu. Add the lines in bold below to the configuration for your pipeline.
 

For our unit tests, we are going to execute them in parallel. So, within the Unit Test stage, add a Parallel step (block).

Do this by adding the lines below in bold. (Note that parallel is lower-cased and those are parentheses after parallel, NOT brackets.)


The parallel step takes a set of mappings with a key (name) and a value (code to execute in that parallel piece). To simplify setting this up, the code for the body of the parallel step (that runs the unit tests) is already done for you. It is in a text file on the VM desktop named Parallel.

Open that file and copy and paste the contents between the opening and closing parentheses in the parallel step in the Unit Test stage.
 

Take a look at the code in the parallel step. For each of the keys in the map (tester1, tester2, and tester3), we have a corresponding map value that consists of a block of code. The block of code has a node to run on (based on a selection by label), a step to clean the workspace, a step to “unstash”, and a call to the shared library Gradle command to run the particular test(s). The reason for the unstash command here is to get copies of the code onto this node for testing without having to pull it down again from source control (since we already did that.) This implies something was stashed. We’ll setup the stash next.

For purposes of having the necessary code to run the unit tests, we need to have the following pieces of our workshop project present on the testing nodes. Subprojects api, dataaccess, and util
 
Project files build.gradle and settings.gradle

So we want to create a stash with them using the DSL’s stash command. To figure out the syntax, we’ll use the
built-in Snippet Generator tool.

Click on the Pipeline Syntax link underneath the editing window on the configuration page in Jenkins.

You’ll now be in the Snippet Generator. ACTION: In the drop-down list of Sample Steps, find and select the stash command. A set of fields for the different named parameters associated with the stash command will pop up. You can click on the blue (with a ?) help button for any of the parameters to get more help for that one.
Type in the values for Name and Includes as follows:

Name: ws-src
Includes:  api/**, dataaccess/**, util/**, build.gradle, settings.gradle

(The ** is a way to say all directories and all files under this area.)
Now, click the Generate Pipeline Script button. The generated code that you can use in your pipeline is shown in the box at the bottom of the screen.


Select and copy the text in the Generate Pipeline Script window. Switch back to the configure page for the pipe1 job and paste the copied text directly under the git step in the Source stage.

Finally, we’ll add the commands to run the integration tests. We’ll add a line to setup the test database we use for the integration testing using credentials we have already setup in Jenkins (mysql-access). Then we will invoke Gradle to run the integrationTest task that we have defined in our build.gradle file.

Enter or copy and paste the lines in bold below into the Integration Test stage in the pipeline code. The withCredentials closure can be copied from the file “Integration” on the desktop.

>Note: Those are brackets (curly braces) {} around env.DBUSER and env.DBPASS.

Save your changes and select Build Now to execute a build of all the stages with the current code. In the
Stage View, you’ll see the builds of our new stages.
 
Take a look at the console output for this run. ACTION: In the Build History window to the left of the stage view, click on the blue ball next to the latest run. Scroll down and look at the execution of the unit testing processes in parallel. This will be the lines starting with [tester 1], [tester 2], and [tester 3]. Th


![image044](https://user-images.githubusercontent.com/558905/37634649-e2d1f0f4-2bcd-11e8-9339-6e221255bd1c.gif)
![image047](https://user-images.githubusercontent.com/558905/37634650-e2e3f966-2bcd-11e8-938f-a8d9c5b91964.jpg)
![image049](https://user-images.githubusercontent.com/558905/37634651-e2f2c1da-2bcd-11e8-9da7-311233f5fa47.png)
![image052](https://user-images.githubusercontent.com/558905/37634652-e30153e4-2bcd-11e8-9cf1-a9835b7ca302.jpg)
![image054](https://user-images.githubusercontent.com/558905/37634653-e30cc990-2bcd-11e8-8bbd-55a7732f3762.png)
![image057](https://user-images.githubusercontent.com/558905/37634654-e319d4c8-2bcd-11e8-98ef-ee1bd07c5aa3.jpg)
![image059](https://user-images.githubusercontent.com/558905/37634655-e32723bc-2bcd-11e8-82cc-b2329d3abdba.gif)
![image061](https://user-images.githubusercontent.com/558905/37634656-e331fd46-2bcd-11e8-8bb1-34bcba5f7300.jpg)
![image063](https://user-images.githubusercontent.com/558905/37634657-e33c8180-2bcd-11e8-9ca3-efe7a7e879c4.jpg)
![image066](https://user-images.githubusercontent.com/558905/37634658-e34a56d4-2bcd-11e8-9fd7-26df75f23540.gif)
![image067](https://user-images.githubusercontent.com/558905/37634659-e35ab5ec-2bcd-11e8-9c79-e87b1f790af7.jpg)
![image070](https://user-images.githubusercontent.com/558905/37634660-e3686110-2bcd-11e8-9622-287a955eeb1c.jpg)
![image072](https://user-images.githubusercontent.com/558905/37634661-e37a1a18-2bcd-11e8-9fdb-4c4f412e425b.gif)
![image074](https://user-images.githubusercontent.com/558905/37634662-e387f0d4-2bcd-11e8-96c8-998caee8c64c.gif)
![image076](https://user-images.githubusercontent.com/558905/37634663-e3932fd0-2bcd-11e8-9ace-a8adeaea4ff9.gif)
![image077](https://user-images.githubusercontent.com/558905/37634664-e3a0dc98-2bcd-11e8-8a20-57cdc073728b.jpg)
![image079](https://user-images.githubusercontent.com/558905/37634665-e3b160a4-2bcd-11e8-8ecd-dc5cfb4e23a0.jpg)
![image080](https://user-images.githubusercontent.com/558905/37634666-e3bfb7d0-2bcd-11e8-96de-39f3060dd940.jpg)
![image081](https://user-images.githubusercontent.com/558905/37634667-e3cf1842-2bcd-11e8-9eb3-b0c73584e000.jpg)
![image082](https://user-images.githubusercontent.com/558905/37634668-e3ddb000-2bcd-11e8-91bc-5ea385ee1a42.jpg)
![image084](https://user-images.githubusercontent.com/558905/37634669-e3f1b456-2bcd-11e8-8c3c-5b4fb8f6493f.jpg)
![image085](https://user-images.githubusercontent.com/558905/37634670-e40a80c6-2bcd-11e8-8760-fd36584b2c96.jpg)
