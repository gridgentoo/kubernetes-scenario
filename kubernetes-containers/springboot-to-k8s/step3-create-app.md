The Spring Boot framework offers an _initializr_. The process creates a skeletal framework for organizing folders and source code for opinionated build tools such as Maven and Gradle. The _initializr_ can be invoked from a variety of interfaces such as [a command-line tool](https://docs.spring.io/spring-boot/docs/current/reference/htmlsingle/#cli-init) or a [web form](https://start.spring.io/). The following interface only requires the standard `curl` utility. Passed to the curl command are a variety of parameters to help us create the desired archetype for our application.

`curl -s https://start.spring.io/starter.tgz \
-d dependencies=web,actuator \
-d language=java \
-d type=gradle-project \
-d applicationName=HelloApplication \
-d groupId=example.hello \
-d name=hello \
-d baseDir=hello \
| tar -xzvf -`{{execute}}

In the `hello` directory is the skeleton of a generated application. We just need to add some code then it can be built and run.
