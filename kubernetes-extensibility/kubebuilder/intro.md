# Creating an Operator based on Kubebuilder #

<img align="right" src="./assets/kubebuilder.png" width="300">

In this scenario you will experience what it's like to create and run a Kubernetes Operator that manages a custom resource. The Operator is created using the Kubebuilder tool. The custom resources will be called "At"s.

[Kubebuilder](https://kubebuilder.io/) was released as open source in August from 2018. Two technical staff members from Google, [Phillip Wittrock](https://www.linkedin.com/in/phillipwittrock/) and Sunil Arora, founded the project. Kubebuilder is now a Kubernetes special interest group (SIG) under Apache License 2.0.

The [Operator Pattern](https://kubernetes.io/docs/concepts/extend-kubernetes/operator/) is a very important technique to extend and build upon the basic features of Kubernetes. Operators are controllers with roles that observe and manage associated [Custom Resource Definitions (CRDs)](https://kubernetes.io/docs/tasks/access-kubernetes-api/extend-api-custom-resource-definitions). There are a variety of projects that provide tools to build Operators. [Kubebuilder](https://kubebuilder.io/) is one prominent technique.

This scenario stands on the shoulders of others. The [`at` utility](https://en.wikipedia.org/wiki/At_(command) is found on many operating systems and it allows you to schedule a command to run at a future date. There is a project called [cnat](https://github.com/programming-kubernetes/cnat) and it stands for _cloud native at_. There is also an outdated tutorial on [Kubebuilder with cnat](https://github.com/programming-kubernetes/cnat/tree/master/cnat-kubebuilder). Many improvements were applied to Kubebuilder which deprecated that tutorial. Recently, [**Ken Sipe**](https://www.linkedin.com/in/kensipe/) created a updated lab inspired from _at_, _cnat_ and the old tutorial. In turn, this scenario is a translation of Ken's lab onto Katacoda. You now get to enjoy the broad shoulders of open source and the cloud native community.

In this scenario you will learn how to:

- Modify, build and test code in a Kubebuilder skeleton project
- Create a new CRD call _at_ through Go structs and automation
- Define RBACs created through generation from code annotations
- Create a controller for observing and managing the _at_ custom resources
- Associate Kubernetes events back to the managed resources
