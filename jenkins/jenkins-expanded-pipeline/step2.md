In this section, we’ll start to fill out our pipeline by adding stages to retrieve the source code and do the builds.
We’ll see how to add shared libraries to our pipeline to encapsulate functionality.

For each of the major parts of our pipeline, we are going to create a stage for the code related to that part.
First, we’ll create a stage to retrieve the source. In your Jenkins session, you should still be on the page from the first lab where we added the code for the node definition. Within the node definition, we’ll add our first stage.

Add the following code (in bold) inside the node definition:
 
`node('worker_node1') {
   stage('Source') {
     //Get code from the Git repo
     git 'git@diyvb2:/home/git/repositories/workshp.git'
   }
}`{{execute}}

>Note: You can leave out the comments (lines starting with //) if you want

The source code to pull down is located on our local system in `/home/git/repositories/workshop.git` in the default branch master.

Now, with our first stage complete, let’s move on to the next one – the Compile stage to build our code. Go ahead and add the framework for the stage under the **Source** stage. We’ll fill in the command next.

Add the lines in bold into your code as shown.

`node('worker_node1') {
   stage('Source') {
     //Get code from the Git repo
     git 'git@diyvb2:/home/git/repositories/workshp.git'
   }
   stage('Compile') {
     // Run gradle to execute compile
   }
}`{{execute}}

Save your changes when done.

Before we can use Gradle in our pipeline, we need to have it installed and tell Jenkins where it is. Gradle is installed on our VM in `/usr/share/gradle`.

To tell Jenkins about this, go to the Jenkins homepage/dashboard (http://localhost:8080).

Click on **Manage Jenkins** in the left menu. Then click on **Global Tool Configuration**.

![image020](https://user-images.githubusercontent.com/558905/37634639-e22c7ebc-2bcd-11e8-8e26-dd0994f75c10.jpg)

Scroll down and find the **Gradle** section.

![image021](https://user-images.githubusercontent.com/558905/37634640-e24009fa-2bcd-11e8-9561-10f2d663548f.jpg)

Click the Add Gradle button. A new section pops up on the screen. Uncheck the **Install automatically** box since we don’t want Jenkins to install Gradle for us. (We already have it installed.) Then, for name, enter `gradle3`.

This is so we can refer to it by this label. For the `GRADLE_HOME` value, fill in where Gradle is installed -
`/usr/share/gradle`.

Your screen should look like the one below - click the Save button to save your global configuration changes.

![image024](https://user-images.githubusercontent.com/558905/37634641-e2513c7a-2bcd-11e8-9a1a-7338c101b1a2.png)

Now that we have Gradle installed and configured for use in Jenkins, we’re ready to call it in our pipeline.
We’re going to do this using a shared library so we can see how those work. We already have a simple shared library routine that does this.

To see the routine, first open up a terminal window by going to the VM’s desktop and clicking the **Terminal Emulator** icon.

![image026](https://user-images.githubusercontent.com/558905/37634642-e2601092-2bcd-11e8-942a-7d549687e766.jpg)

Then, switch to the local area for our `shared_libraries` project and print out the file on screen. Type the commands below in the terminal window to do this.

`cd shared_libraries/vars
cat gbuild3.groovy`{{execute}}

![image029](https://user-images.githubusercontent.com/558905/37634643-e2711900-2bcd-11e8-8c63-21fad7cfccd7.png)


This code has already been pushed to a remote Git repository on our VM. This is where Jenkins will download it from as a shared pipeline library. To see the location of the code, we can ask Git where the remote repository is.

Type the following in the same directory in the same terminal window.

`git remote -v`{{execute}}

The output from this command shows the remote repository location where the code is pushed to and where it can be fetched from. We will need this location to configure the Global Library load in Jenkins.

![image031](https://user-images.githubusercontent.com/558905/37634644-e27fd594-2bcd-11e8-92e1-78de45ea18dd.png)

Now that we have our code to invoke Gradle in the shared library repository, let’s look at how Jenkins makes that available.

Go back to the Jenkins `homepage/dashboard` (http://localhost:8080).

Click on **Manage Jenkins/Configure System**.
 
Scroll down on this page until you find the **Global Pipeline Libraries** section. This is where we load in the library from Git that we were just looking at. There is nothing to change here, but look at the different fields – particularly the Project Repository field. Notice that the location in here is the same location on the Git remote where we have our shared pipeline library.

![image034](https://user-images.githubusercontent.com/558905/37634645-e28fccba-2bcd-11e8-8437-e7f25d3f3144.jpg)

Now, we need to go back to our pipeline, bring in the shared library with the gradle build function (gbuild3) and call it to build our code.

Go to this URL: http://localhost:8080/job/pipe1/configure (or go to the dashboard, then to the pipe1 project, and click configure).

Switch to the **Pipeline** tab (or scroll down) to the text entry box with our code. Add the lines in bold below. ( We discussed what these lines are doing in the lecture. 

>Note: the underscore character that is required at the end of the @Library line. Also, those are parentheses around ‘Utilities2’, not brackets.
 
`@Library('Utilities2')_
node('worker_node1') {
   stage('Source') {
     //Get code from the Git repo
     git 'git@diyvb2:/home/git/repositories/workshp.git'
   }
   stage('Compile') {
     // Run gradle to execute compile
     gbuild3 "clean compileJava -x test"
   }
}`{{execute}}

Before we leave this page, let’s setup our job in Jenkins to poll the SCM to watch for changes in source control and then trigger a build.

Switch to the Build Triggers tab (or scroll up to the Build Triggers section of the page). Click the box for **Poll SCM**. Type a string of five asterisks separated by spaces `* * * * *` in the text box next to **Poll SCM**. You’ll see a warning message and can ignore it.

![image038](https://user-images.githubusercontent.com/558905/37634647-e2b13d6e-2bcd-11e8-88e5-d6c5801db480.png)

Click on Save. 

After a minute or so, Jenkins should automatically detect that there is “new” code it hasn’t built and start a build running. 

After the build completes, you will be able to see the results in the Staging View. Notice the matrix here with rows for each build (we only have 1 so far) and columns corresponding to the stages that we have defined so far (Source and Build). Hover over each box and look at the logs from each byclicking on the Logs link in the pop up window.

>Note: You may need to **Disable Auto Refresh** in the upper right corner to keep the pop ups on the screen.

![image041](https://user-images.githubusercontent.com/558905/37634648-e2c09138-2bcd-11e8-893e-4d52f3a957f9.jpg)
