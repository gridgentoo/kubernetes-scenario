Jenkins is an open source automation tool that can be used to accelerate the application development process using CI/CD pipelines. Jenkins controls and manages application development life cycle processes, including the build, test, publish, stage, deploy, and smoke test processes, among others.

#### Jenkins architecture

There are two main components in the Jenkins architecture:

1. **Jenkins Master:** Your CI/CD controller, handling various tasks, such as:
    - Job scheduling
    - Distributing the workload among Jenkins Slaves
    - Jenkins Slave monitoring
    - Logging and representing job results

2. **Jenkins Slaves:** A set of Java-based programs that run on the remote host. Jenkins Slaves mainly execute instructions from Jenkins Masters. 

Jenkins Masters and Jenkins Slaves are functionalities, which basically means that both can coexist on the same host. In small or lab environments, there are usually no issues with running both a Jenkins Master and Jenkins Slaves on the same host, but if you have hundreds (or thousands) of jobs running in your environment, it makes sense to run the Jenkins Master and Jenkins Slaves on different nodes, and to have several Jenkins Slaves, to distribute the load among them. 

