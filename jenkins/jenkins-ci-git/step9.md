Now, we will create a new Jenkins Job.

 + Go to the Jenkins Dashboard.
 
 + Click on **New Item** 
 
 + Enter a name for new item in the textbox.
 
 + Click on **Freestyle Project**
 
 + Click **OK**

A new project will be created and you will be redirected to configure project page.

Here, we will set **Git** as our **Source Code Management**. To do so:

 + Select **Git** in the Source Code Management section.
 
 + Enter the **URL of your repository** in the textbox
 
 + Keep all other options as it is.
	

Now we will select **Build Trigger** (When to trigger a build). To do so:

 + Check the option of **Poll SCM**
 
 + Enter a cron expression as * * * * * (with space in between each *) in the text field.
   (It stands for checking repository for a possible change every minute)


Now we will add **build step**. To do so:

 + Click on **Add Build Step** drop down under **Build** section.

 + Select **Execute Shell** option.

 + Enter following in the **textfield**

	- cd /JenkinsGitTutorial
	- javac HelloWorld.java
	- java HelloWorld
		 
 + Click on **Apply**

 + Click on **Save**
 
	
You can see the First Build under **Build History** section. To see the output:

 + Click on **#1**

 + Click on **Console Output** 
 

Cheers! You can see the output of HelloWorld.java program in the console output.

