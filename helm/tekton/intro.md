# Tekton on Kubernetes #

The [Tekton Pipelines project](https://tekton.dev/) provides Kubernetes-style resources for declaring [CI](https://martinfowler.com/articles/continuousIntegration.html) / [CD](https://martinfowler.com/bliki/ContinuousDelivery.html) style pipelines.

<img align="right" src="./assets/tekton.png" width="400">

Tekton is an open-source project that formed as a subproject of the [Knative](https://knative.dev/) project in March of 2019. Using established Kubernetes style declarations whole pipelines can be declared. The pipelines run on Kubernetes like any other process. Each step runs as an independent container. Tekton also helps normalize and standardize the terms and methods for forming and running pipelines. Tekton pipelines can complement a variety of popular CI/CD engines. For more information also see the [Continuous Delivery Foundation (CDF)](https://cd.foundation/).

This scenario demonstrates the building, deploying and running a Node.js application using Tekton on Kubernetes.

> Tekton Pipelines is a Kubernetes extension that installs and runs on your Kubernetes cluster. It defines a set of Kubernetes Custom Resources that act as building blocks from which you can assemble CI/CD pipelines. Once installed, Tekton Pipelines becomes available via the Kubernetes CLI (kubectl) and via API calls, just like pods and other resources. Tekton is open-source and part of the CD Foundation, a Linux Foundation project. [-- Tekton Project](https://tekton.dev/)

Tekton Pipelines are ([detailed here](https://github.com/tektoncd/pipeline/blob/master/README.md)):

- Cloud Native
- Decoupled
- Typed

You will learn:

- how to install a private registry with a UI
- how to install the Tekton controller and optional CLI tool
- how to declare resources specific to defining a CI/CD pipeline
- about various Tekton resources like Resources, Tasks, and Pipelines
- how to kick off a pipeline and inspect its progress
