# Spring Boot to Kubernetes #

<img align="right" src="./assets/spring-boot-logo.png" width="300">

The scenario walks through a series of steps that go from a blank slate of no code to running a Spring Boot application on Kubernetes. Starting with a blank Kubernetes cluster and an empty source code directory these steps will:

1. Generate a Spring Boot skeleton project for a demo application
2. Add some basic REST endpoints to the code
3. Define a multi-stage Dockerfile
4. Build the jar and the container
5. Push the container to a local, private registry
6. Send a declaration to Kubernetes to start the demo application
7. Run the application

You will learn how to:

- write a getting started Spring Boot application
- run a Gradle (or Maven) build when the container is built
- push a container to a private registry on Kubernetes
- instruct Kubernetes to start and application
- access an application service running on Kubernetes

A good followup to this scenario is _Distilling Java Containers_.
