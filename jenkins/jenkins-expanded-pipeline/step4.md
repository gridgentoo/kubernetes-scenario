In this part, we’ll see how to configure SonarQube to work with our pipeline. We’ll set up a web hook to have SonarQube notify us when it’s done. We’ll also add in the Jacoco integration for code coverage and see how that works when we run our pipeline.

Start out by adding the empty stage definition for an Analysis stage in our pipeline code. This should come after the Integration Test stage but before the closing bracket. We will also define a groovy variable to reference the location where our SonarQube scanner/runner is installed.

Add the lines in bold below.
 
 

We will do our analysis part using the tool SonarQube. SonarQube is already installed and configured globally on the system. If you want to look at the configuration for this, open up a new tab or browser to http://localhost:8080/manage - the url for the Manage Jenkins functionality. From here, click on the top entry to Configure System. Scroll down the page until you find the SonarQube Servers section. (This integration is provided by the SonarQube plugin.)

Switch back to the configure page for pipe1 if not already there. Let’s look at one of the DSL commands available for us to work with SonarQube. Click on the Pipeline Syntax link at the bottom of the page. This puts us back into the Snippet Generator.

In the Sample Steps dropdown, find the withSonarQubeEnv method. There are several of these types of “with environment” methods available in Jenkins DSL. They allow us to wrap other steps with specific environment
variables or settings needed to run certain steps. Click on the blue Help button (with the ?) if you want to see more information.

Next, find the waitForQualityGate step in the dropdown. A Quality Gate here is a set of standards defined in SonarQube that the analysis must meet or exceed for the code being analyzed to pass. Select this item and then click on the blue Help button (with the ?) and read about how this works.
 

Notice that it basically waits for a webhook that has been setup in SonarQube to signal that the analysis is complete
before moving on. We’re going to setup such a webhook now.
 
Open the SonarQube instance on your VM by going to http://localhost:9000 and logging in (upper right corner) with user admin and password admin.

Click on Administration, then Configuration, and then on General Settings. Then scroll down until you see the
Webhooks section directly under that column. Click on that. Fill in the fields as follows:

Name: jenkins_sonar
URL: http://localhost:8080/sonarqube-webhook/ (Note: The trailing slash on the URL is important! )

Once you have filled in the fields, click the Save button. Then the webhook is in place. Switch back to your Jenkins
pipe1 configure page.


Now we are ready to start filling in our Analysis stage. We have seen the SonarQube server configuration. To actually run SonarQube against our project, we use an executable called a sonar scanner/runner that is installed on the system at /opt/sonar/bin/sonar-runner.

Add the lines below to the Analysis stage.


Then, we’ll add in the step that we saw in the Snippet Generator to wait on the web hook that we created.
 
Add the lines in bold at the end of the Analysis stage. (Note that we are wrapping this in a Jenkins timeout step just to ensure that we don’t get stuck waiting on a hung server or other issue.)


There is one other item we want to add in to our Analysis stage - code coverage using a tool called Jacoco. For expediency, we’ll just add in the code here since we’ve discussed it in the lecture. You can find this code in the desktop Analysis file. So you can copy and paste it between the sonar-runner invocation and then wait for the quality gate.

Add the lines in bold below into your code.

Save your changes and Build Now. After this, you’ll have another stage in the pipeline in your stage view.

You should also see some new symbols and links available to you that relate to SonarQube. In the left-hand menu will be a link to SonarQube. Note the symbol next to it. This same symbol should be next to your last build. Click on either the symbol or the SonarQube link in the menu to go to the SonarQube analysis for this build.


When you are done clicking around in the SonarQube report, go back to the Stage View page for pipe1 (http://localhost:8080/job/pipe1/). You may have noticed that in the SonarQube report we did not have line coverage information. This is because we chose to add it separately for demo purpose. However, you should now see a graph above the stage view, with the title Code Coverage Trend, showing some info about line coverage.

Click on the Coverage Trend link in the left-hand menu and click again on the larger graph that pops up. You can now see more of the code coverage information for the project. You can also click around and drill into the details.

