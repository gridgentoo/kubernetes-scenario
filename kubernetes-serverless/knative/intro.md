# Knative on Kubernetes #

(This draft tutorial is under construction in step 3. Contact me for questions: jonathan.johnson@dijure.com, December 8, 2018)

<img align="right" src="./assets/knative.png">

Knative is a Kubernetes-based platform to build, deploy, and manage modern serverless workloads. It drives with three primary features:

|   |   |
|---|---|
| **Serving** | Scale to zero, request-driven compute model |
| **Build**   | Cloud-native source to container orchestration |
| **Events**  | Universal subscription, delivery and management of events |

> [Knative](https://github.com/knative/docs) (pronounced kay-nay-tiv) extends Kubernetes to provide a set of middleware components that are essential to build modern, source-centric, and container-based applications that can run anywhere: on premises, in the cloud, or even in a third-party data center.

> Each of the components under the Knative project attempt to identify common patterns and codify the best practices that are shared by successful real-world Kubernetes-based frameworks and applications. Knative components focus on solving many mundane but difficult tasks such as:

> - Deploying a container
> - Orchestrating source-to-URL workflows on Kubernetes
> - Routing and managing traffic with blue/green deployment
> - Automatic scaling and sizing workloads based on demand
> - Binding running services to eventing ecosystems]()
> - Developers on Knative can use familiar idioms, languages, and frameworks to deploy any workload: functions, applications, or containers.

These instructions have been adapted from [Getting Started with Knative App Deployment](https://github.com/knative/docs/blob/master/install/getting-started-knative-app.md).

There are a set of helpful solutions that allow serverless functions to run:

- Knative (pronounced kay-nay-tiv) extends Kubernetes to provide a set of middleware components that are essential to build modern, source-centric, and container-based applications that can run anywhere: on premises, in the cloud, or even in a third-party data center.
- Istio is a service mesh for Kubernetes
- Kubernetes is the container management system that targets a variety of cloud and data center resources. An operating system for your data center.

In the following steps you will learn:

- how to install Knative Kubernetes,
- how to install and invoke function on Knative.

More about the Knative and Istio architecture is described in the [documentation](https://github.com/knative/docs).
