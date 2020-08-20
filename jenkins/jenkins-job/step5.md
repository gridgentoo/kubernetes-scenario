
In order to make changes to the source code, we'll clone a copy of the Git repository into an Eclipse project.

Start Eclipse by running C:\Software\eclipse\eclipse.exe and use C:\Workspace as Workspace.

Close the Welcome page.

From the main menu, select File → Import...

Select Git → Projects from Git.

![image049](https://user-images.githubusercontent.com/558905/37422402-7a28ab8c-2791-11e8-8518-480d902da1cf.png)

Click Next.

Select Clone URI and then click Next.

![image051](https://user-images.githubusercontent.com/558905/37422404-7a4815f8-2791-11e8-8f27-071478d7dae3.png)

You might think that 'Existing local repository' would be the right choice, since we're cloning from a folder on the same machine. Eclipse, however, expects a "local repository" to be a working directory, not a bare repository. On the other hand, Jenkins will complain if we try to get source code from a repository with a working copy. So the correct thing is to have Jenkins pull from a bare repository, and use Clone URI to have Eclipse import the project from the bare repository.

Click on Local File... and then navigate to C:\Software\repos\SimpleGreeting.git

![image053](https://user-images.githubusercontent.com/558905/37422406-7a6b0d2e-2791-11e8-9999-130285290c14.png)

Click OK.

Back in the Import Projects dialog, click Next.

![image055](https://user-images.githubusercontent.com/558905/37422408-7a85f210-2791-11e8-9bc3-620a1565408d.png)

Click Next to accept the default 'master' branch.

![image057](https://user-images.githubusercontent.com/558905/37422410-7aa6dcb4-2791-11e8-8e23-bb15ca120209.png)

![image059](https://user-images.githubusercontent.com/558905/37422413-7ac655b2-2791-11e8-926e-a48c170ee25f.png)

Select Import as a General Project and click Next.

![image061](https://user-images.githubusercontent.com/558905/37422415-7ae3e654-2791-11e8-87ba-984bfa25ca39.png)

Click Finish.

![image063](https://user-images.githubusercontent.com/558905/37422417-7b04f07e-2791-11e8-8550-ba291f4c0bb7.png)

At this point, we could go ahead and edit the files, but Eclipse doesn't understand the project's layout. Let's tell Eclipse what we know - that this project is built using Apache Maven.

![image065](https://user-images.githubusercontent.com/558905/37422419-7b232df0-2791-11e8-95b2-4dfc1389aaef.png)

Right-click on the SimpleGreeting project in the Project Explorer, and then select Configure → Convert to Maven Project.

![image067](https://user-images.githubusercontent.com/558905/37422421-7b4cc44e-2791-11e8-81ef-c4256695bfbf.png)

After few seconds, you should now see the project represented as a Maven project in the Project Explorer.

![image069](https://user-images.githubusercontent.com/558905/37422423-7b772d56-2791-11e8-8710-db8eab6d7494.png)
