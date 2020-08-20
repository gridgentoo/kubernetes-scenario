As a distributed version control system, Git works by moving changes between different repositories. Any repository apart from the one you're currently working in is called a "remote" repository. Git doesn't differentiate between remote repositories that reside on different machines and remote repositories on the same machine. They're all remote repositories as far as Git is concerned. 

In this lab, we're going to start from a source tree, create a local repository in the source tree, and then clone it to a local repository. Then we'll create a Jenkins job that pulls the source files from that remote repository. Finally, we'll make some changes to the original files, commit them and push them to the repository, showing that Jenkins automatically picks up the changes.
 
If you have Git online, follow [this](https://github.com/Virtuant/katacoda-scenarios/blob/master/jenkins/jenkins-job/step2a.md) path.

https://katacoda.com/virtuant/courses/jenkins/jenkins-job#step2a.md

If you have a Windows version of Git, use [this](https://github.com/Virtuant/katacoda-scenarios/blob/master/jenkins/jenkins-job/step2b.md) link.
