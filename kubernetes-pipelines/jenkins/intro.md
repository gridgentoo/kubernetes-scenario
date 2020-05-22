# Jenkins on Kubernetes #

![Jenkins](/javajon/courses/kubernetes-pipelines/jenkins/assets/jenkins.png "Web server, reverse/mail proxy server")

## Canary Releases with Jenkins on Kubernetes ##

This demonstration covers these topics:

- A personal Kubernetes cluster
- Install and configure Jenkins from Helm chart
- Installing Prometheus from Helm chart
- Demonstrating Kubernetes plugin for Jenkins
- Build, deploy and run container from Jenkinsfile
- Update container with canary deployment
- Monitoring canary deployments
- Rollback canary

> Canary release is a technique to reduce the risk of introducing a new software version in production by slowly rolling out the change to a small subset of users before rolling it out to the entire infrastructure and making it available to everybod. - [MartinFowler.com](https://martinfowler.com/bliki/CanaryRelease.html)

## Instructions Overview ##

- Start a personal Kubernetes cluster
- Create a Quay.io robot account and copy the credentials
- Install Jenkins on the cluster
- Configure Jenkins to leverage Kubernetes
- Create a pipeline that builds on and publishes to Kubernetes
- Roadmap: Add Prometheus-Operator monitoring stack from Helm charts
- Roadmap: Observe monitoring of a deployed container
- Roadmap: See how canary deployments work with this workflow

> [Jenkins]("https://en.wikipedia.org/wiki/Jenkins_%28software%28") is an open source automation server written in Java. Jenkins helps to automate the non-human part of the software development process, with continuous integration and facilitating technical aspects of continuous delivery. It is a server-based system that runs in servlet containers such as Apache Tomcat. It supports version control tools, including AccuRev, CVS, Subversion, Git, Mercurial, Perforce, ClearCase and RTC, and can execute Apache Ant, Apache Maven and sbt based projects as well as arbitrary shell scripts and Windows batch commands. The creator of Jenkins is Kohsuke Kawaguchi. Released under the MIT License, Jenkins is free software.
