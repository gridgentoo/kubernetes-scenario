
The project that we used as a sample consists of a basic "Hello World" style application, and a unit test for that application. In this section, we'll alter the core application so it fails the test, and then we'll see how that failure appears in Jenkins.

In the Project Explorer, expand the src/main/java tree node.

![image071](https://user-images.githubusercontent.com/558905/37422425-7b9e442c-2791-11e8-9c42-0ad13120e066.png)

Double-click on Greeting.java to open the file.

![image073](https://user-images.githubusercontent.com/558905/37422427-7bc09b4e-2791-11e8-8f65-87cf348ef269.png)

Find the line that says 'return "GOOD";'. Edit the line to read 'return "BAD";'

![image075](https://user-images.githubusercontent.com/558905/37422429-7be37d26-2791-11e8-9118-0896495d2b4a.png)

Save the file by pressing Ctrl-S or selecting File → Save.

Now we've edited the local file. The way Git works is that we'll first 'commit' the file to the local workspace repository, and then we'll 'push' the changes to the upstream repository. That's the same repository that Jenkins is reading from. Eclipse has a short- cut button that will commit and push at the same time.

Right-click on SimpleGreeting in the Project Explorer and then select Team → Commit...

Enter a few words as a commit message, and then click Commit and Push.

![image077](https://user-images.githubusercontent.com/558905/37422433-7c046388-2791-11e8-8ef9-d99ef24a1281.jpg)

Now, flip back to the web browser window that we had Jenkins running in. If you happen to have closed it, open a new browser window and navigate to http://localhost:8080/SimpleGreeting. After a few seconds, you should see a new build start up.

![image079](https://user-images.githubusercontent.com/558905/37422437-7c25521e-2791-11e8-9a40-595aa7547f5c.png)

If you refresh the page, you should see that there is now a 'Test Result Trend' graph that shows we have a new test failure.

![image081](https://user-images.githubusercontent.com/558905/37422441-7c76f09c-2791-11e8-872b-779cdeccde6a.png)

What happened is that we pushed the source code change to the Git repository that Jenkins is reading from. Jenkins is continually polling the repository to look for changes. When it saw that a new commit had been performed, Jenkins checked out a fresh copy of the source code and performed a build. Since Maven automatically runs the unit tests as part of a build, the unit test was run. It failed, and the failure results were logged.
