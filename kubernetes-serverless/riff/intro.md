# Riff on Kubernetes #

(This draft tutorial is under construction. Contact me for questions: jonathan.johnson@dijure.com, March 2018)

![Riff](/javajon/courses/kubernetes-serverless/riff/assets/riff.png "Riff is for functions")

> [Riff](https://projectriff.io) The riff CLI helps developers build and run functions using Knative. It includes commands to install Knative in a Kubernetes cluster, and for managing functions, services, channels, and subscriptions.

These instructions have been adapted from [Getting started]https://projectriff.io/docs/getting-started/). 

There are a set of helpful solutions that allow serverless functions to run:

- Riff is the command-line tool, CLI
- Knative (pronounced kay-nay-tiv) extends Kubernetes to provide a set of middleware components that are essential to build modern, source-centric, and container-based applications that can run anywhere: on premises, in the cloud, or even in a third-party data center.
- Istio is a service mesh for Kubernetes
- Kubernetes is the container management system that targets a variety of cloud and data center resources. An operating system for your data center.

In the following steps you will learn:

- how to install Riff, Knative and Istio on Kubernetes,
- how to install and invoke functions from the Riff CLI interface.

More about the Riff, Knative and Istio architecture is described in the [Riff documentation](https://projectriff.io).
