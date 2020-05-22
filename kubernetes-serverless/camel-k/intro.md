# Camel K on Kubernetes #

(This draft tutorial is under construction. Contact me for questions: jonathan.johnson@dijure.com November 9, 2018)

<img align="right" src="./assets/camel-k.png">

[Camel K](https://github.com/apache/camel-k) Apache Camel K (a.k.a. Kamel) is a lightweight integration framework built from Apache Camel that runs natively on Kubernetes and is specifically designed for serverless and microservice architectures. Camel K combines the roots of Apache Camel with Serverless on Knative and Kubernetes. Camel K is a subproject of Apache Camel announced in October 2018.

- Camel K has a command-line tool, CLI, called `kamel`
- Knative (pronounced kay-nay-tiv) extends Kubernetes to provide a set of middleware components that are essential to build modern, source-centric, and container-based applications that can run anywhere: on premises, in the cloud, or even in a third-party data center.
- Istio is a service mesh for Kubernetes
- Kubernetes is the container management system that targets a variety of cloud and data center resources. An operating system for your data center.

You will learn how:

- to install Camel K on Kubernetes
- to install functions from the CLI interface

More about the Camel K, Knative and Istio architecture is described in the [Camel K documentation](https://github.com/apache/camel-k).
