There is a simple application that lists the files from the current directory. It's written in Java and can readily be cloned. You can see the heart of the small [ListDir application here](https://raw.githubusercontent.com/javajon/listdir/master/src/main/java/org/dijure/lister/ListDir.java).

`git clone https://github.com/javajon/listdir && cd listdir`{{execute}}

Inspect the directory contents.

`tree`{{execute}}

ListDir is a standard Java application with a main that lists files in the current directory. All of it can be built and run using Gradle.

`./gradlew run`{{execute}}

This will create an executable jar.

`./gradlew jar`{{execute}}

The jar task creates an executable jar near 2600 bytes in size.

`ll build/libs/listdir*`{{execute}}

So far, this is a simple app, and using our local operating system with Java installed that can build and run this application.

`time java -jar build/libs/listdir-0.1.0.jar`{{execute}}

On overage, it should take about 0m0.150s - 0m0.200s to run the application.

As we know, relying on prerequisite installs of precise operating systems, utilities, and runtimes like Java remain points of failure between development, testing, and production. Stacks we rely on are never as idempotent as we sometimes blindly hope.
