A Dockerfile has already been provided.

`cat Dockerfile`{{execute}}`

Notice the file contains two stages, as delineated by the two FROM statements. The top first stage defines a container complete with a JDK and Gradle. From this stage, the Gradle build is executed to produce the jar. In the second stage, defined is just a container that has just the Java runtime engine. The jar file from the previous stage is copied and the rest of the lines define how to execute the jar containing the Spring Boot application we created.

Copy the Dockerfile into the project.

`cp --force Dockerfile hello`{{execute}}

Change to the hello project directory.

`cd hello`{{execute}}
