As this scenario is all about how we can use Git with Jenkins to continuously build target based on the commits made to the repository on GitHub, you must have a GitHub account.
If not, then create an account on **GitHub.com**

After logging in to your GitHub account, create a **new Repository**.
Keep it blank for now.

Now, log into the container by:

`docker exec "CONTAINER ID/NAME" /bin/bash
`{{execute}}

For this scenario, we have already set up both **Git** & **Java** for you on this machine.

You can check if they are installed by:

`git --version
`{{execute}}

`java -version
`{{execute}}


First, we have to set two identifiers for GIT. To do so, type:

	- git config --global user.email "you@example.com"
	- git config --global user.name "Your User Name"
	
Replace quoted strings with your actual email & username.

Now, clone my repository which contains a **simple java program** which we will use for our demo.
To do that: 

`git clone https://github.com/AjinkyaBapat/JenkinsGitTutorial.git
`{{execute}}


Now to push this cloned repository to your own, you have to change the remote url from my repository to your newly created repository.
To do that:

`git remote set-url origin _http://github.com/YOU/YOUR_REPO_
`{{execute}}

(Make sure to change the url to your own repository)

Now push this local repository to your remote repository by:

`git push origin master
`{{execute}}


Now you have your repository ready to be integrated with Jenkins.

