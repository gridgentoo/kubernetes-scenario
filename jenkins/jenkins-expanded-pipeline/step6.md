Next we’ll see how to integrate Jenkins and Gradle with Artifactory to deploy our war file artifact into an Artifactory repository and a way to retrieve the latest version of our artifact from Artifactory.

First, as we always do, create a stage block for the new stage. We’ll call this one Publish Artifacts.


We already have an Artifactory instance set up and running on this machine. You can see it by going to a different/new tab in your browser. In that other tab, switch to the Jenkins dashboard, then to Manage Jenkins, then to Configure System, and scroll down until you find the Artifactory section.

You can see that we have it running at http://localhost:8081/artifactory .

If you want, you can click the Test Connection button to see it test the connection to the system.



The Artifactory plugin provides a default Artifactory object that we can use, as well as several steps for working with Jenkins and various build systems, such as Gradle and Maven. Steps a-h below will guide you through adding the commands you need to setup and execute the publish to Artifactory using Gradle.


Go back to the browser tab where you were configuring your pipe1 job (where you added the new Publish Artifacts stage).

Add the commands in each step below (a-h) to your new stage. Note – all of these lines are in a file on your desktop named Publish that you can copy and paste from.

First, we need to configure a couple of things.

To point the Artifactory object to our installed instance, add the following line in your stage block. (Here,
LocalArtifactory is the Server ID we gave it in the global configuration.)


Now, we’ll create a new Gradle object that knows about the Artifactory instance and point it to the gradle version we have defined in our global configuration. Add the lines below.

 
Next, we’ll tell Artifactory which Artifactory repositories to use for deploying (storing) objects into (libs- snapshot-local) and which one to resolve (retrieve) dependencies from (remote-repos).
 

Artifactory can also publish info about each build. We’ll have it do that as well. Add the lines below.

We want the publish to use Maven type descriptors and not to publish the individual jar files we create (just the war file we end up with). Add these lines to accomplish those objectives.
 

We want to tell Jenkins that we aren’t already loading the related Gradle plugin (com.jfrog.artifactory) in our
Gradle script. So it needs to do it. We do that with the line below. Add it.

Finally, we are ready to run the Artifactory Gradle build and invoke Gradle’s built-in artifactoryPublish task. Add this line to do that.

Just one more – add the line below to publish the build info to Artifactory as well.

Now, you should have your completed Publish Artifacts stage.
 

Our next stage is the one that will retrieve the latest version from Artifactory. We may not always want to
retrieve the latest version but we’ll show how to do it here via a kludge process since the free version of Artifactory doesn’t support this.
Essentially, we have a set of shell commands that parse pom files in Artifactory and extract the details about what version is latest, and then we drill down into Artifactory with that information, find the latest version and retrieve it.

We again are storing this code in an external file – in this case in the resources directory of our shared library.

Take a look at the code we’re using for this task by running the following command in a terminal session:

cat shared_libraries/resources/ws-get-latest.sh

 
To invoke this code in our stage, we will use the libraryResource step to load it. Then we can just pass the code to the sh step and have it executed.

Add the section in bold below into your pipeline – after the Publish Artifacts stage and before the closing bracket.


There’s one other piece we want to add here. Since this stage is retrieving the latest artifact, we want to keep that to pass on to later stages. As we’ve seen, one way to do this is with the stash step.

Add the stash step in bold below into your stage.


Now Save your updates and Build with Parameters. Remember that if you changed any parameter values last time, make them the same or higher so this will be the latest.
After this runs, you’ll see the newest stages in the stage view.

You can also go into the console log to see the output and what it pulled from Artifactory. (The links generated in the log are actually usable. If you click on one, you can download the artifact as well.)
 
 

