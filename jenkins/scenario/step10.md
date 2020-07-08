If you remember, we have selected a cron expression to check for any possible change in the given Git repository on every minute.

Now, we will make a small change in the local copy of repository, push it to the remote repository & will observe our Jenkins Job to see that it is being triggerred after a change made to the remote repository.

To do so:

 + Log into your Container.

 + Go to your local repository (i.e. **JenkinsGitTutorial**)

 + Make some changes in the **HelloWorld.java** file or create a new temporary text file in the directory.

 + Now push the changes to remote repository.

Once the changes are pushed to remote repository, we can observe the **Build History** section of our project dashboard.

After waiting for few seconds, you will observe a **new job** started running in the **Build Histoy** Section.

This is because, Jenkins continuously checks for the changes in given repository. 
Cron expression specified by us to do so checks for changes every minute in the remote repository.

If it identifies that changes are made, it automatically triggers a new build.

You can observe a statement **Caused by an SCM Change** in the Console Output of this new build.


Cheers! Yoy have successfully integrated Jenkins wit Git in this tutorial.
