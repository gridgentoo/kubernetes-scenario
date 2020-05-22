# Creating and Operator based on KUDO #

<img align="right" src="./assets/kudo.png" width="400">

Kubernetes Universal Declarative Operator (KUDO) provides a declarative approach to building production-grade Kubernetes Operators covering the entire application lifecycle.

## Operator Pattern ##

If you find yourself needing to manage specialize services and solution sets on Kubernetes, often writing an Operator provides controllers to manage these complexities. An Operator contains imperative management logic that react to declarative requests and Kubernetes events. More about the [Operator Pattern can be found here](https://kubernetes.io/docs/concepts/extend-kubernetes/operator/). There are a variety of projects that offer you development solutions for writing Operators. KUDO is a prominent solution for writing Operators. The scenario teaches you how to use KUDO.

## About KUDO ##

KUDO is an open source Apache 2.0 project governed by the good people at [D2IQ](https://d2iq.com/) and others. KUDO is a much easier way to write an Operator as it embraces a declarative form over imperative Go based coding.

In this scenario you will hand craft a Operator, create an Operator repository, and run the Operator to coordinate with your Kubernetes cluster. 

In this scenario you will learn how to:

- Install the KUDO plugin into kubectl
- Generate an Operator
- Configure Operator logic
- Package and Server an Operator
