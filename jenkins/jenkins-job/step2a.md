### Linux

Right click in the empty area and select Git Bash Here. The Git command prompt will open.

![image015](https://user-images.githubusercontent.com/558905/37422363-77b63ec8-2791-11e8-866f-7984ad0c658f.png)

Enter the following commands:

`ls`{{execute}}

![image017](https://user-images.githubusercontent.com/558905/37422365-77ded9b4-2791-11e8-8ea9-737c75c92fe1.png)

`git config --global user.email "admin@engage.com" 
git config --global user.name "Bob Smith"`{{execute}}

The lines above are actually part of the initial configuration of Git. Because of Git's distributed nature, the user's identity is included with every commit as part of the commit data. So we have to tell Git who we are before we'll be able to commit any code.

Enter the following lines to actually create the Git repository:

`git init git add .
git commit -m "Initial Commit"`{{execute}}
	
The above lines create a git repository in the current directory (which will be C:\LabFiles\Create a Jenkins Job\SimpleGreeting), add all the files to the current commit set (or 'index' in git parlance), then actually performs the commit.

Enter the following, to create a folder called repos under the C:\Software folder.

`mkdir /c/Software/repos`{{execute}}
	
Enter the following to clone the current Git repository into a new remote repository.

`git clone --bar . /c/Software/repos/SimpleGreeting.git`{{execute}}

![image019](https://user-images.githubusercontent.com/558905/37422368-77fbcce0-2791-11e8-8ce7-a5f433cc769e.png)

>Note: C:\Software\repos\SimpleGreeting.git. Jenkins will be quite happy to pull the source files for a job from this repo.
