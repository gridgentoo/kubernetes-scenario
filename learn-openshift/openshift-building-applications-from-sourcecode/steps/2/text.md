The first S2I lab will use a very simple PHP application that displays the PHP configuration using a standard PHP function—phpinfo(). It's composed of a single index.php file, with the following content:


```
cat index.php
<?php
phpinfo();
?>
```

This application is enough to demonstrate a basic S2I build. We have already prepared a Git repository on GitHub, which contains the code of our application. The repository is located at https://github.com/neoncyrex/phpinfo.git, and is going to be used in this lab.


The oc new-app command can build an application from its source code, using either a local or remote Git repository.

Let's clone the repository locally, to be able to make changes to it. This will create the phpinfo directory, with repository files:
`git clone https://github.com/neoncyrex/phpinfo.git`{{execute}}



The build and application deployment processes can be initiated by running the oc new-app command. This basic S2I strategy can be triggered as follows:
`oc new-app phpinfo`{{execute}}


```
--> Found image 23e49b6 (17 hours old) in image stream "openshift/php" under tag "7.0" for "php"
...
<output omitted>
...
--> Success
    Build scheduled, use 'oc logs -f bc/phpinfo' to track its progress.
    Application is not exposed. You can expose services to the outside world by executing one or more of the commands below:
     'oc expose svc/phpinfo'
    Run 'oc status' to view your app.
```

The preceding command does the following:

- Uses phpinfo as a path to the application's source code
- Automatically detects the programming language—PHP
- Initiates the build process
- Creates a number of OpenShift resources