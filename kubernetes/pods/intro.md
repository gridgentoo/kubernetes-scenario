Введение в **Pods**.

В этой лабораторной работе мы рассмотрим, как запускать контейнеры в **Pods**.

**Pods** являются основными строительными блоками **Kubernetes**.
**Pods** - это **группы контейнеров с общими пространствами имен и общими томами - shared volumes**.

* **Pods** для контейнеров всегда расположены на одном **host**
* Pod containers share a single IP and portspace and communicate via localhost
* Pod containers have access to shared volumes for storage
* Pods are designed to be ephemeral (like cattle, not pets)

In this lab we will explore the following:

## Creating Pods with the command line

Using the command line is an easy way explore pod concepts.
These labs will let you inspsect pod configurations, running containers and networking.

## Creating Pods with manifest files

For production systems, using the command line can be error prone.
In this exercise, we explore file based pod specification and creation.

## Inspecting Pods

Understanding how a pod works will help you debug issues when they arrive.
In this lab we will explore the Pod lifecycle, networking, and configuration.

For more information, see the Kubernetes [documentation][docs].

<!-- Links Referenced -->

[docs]:           https://kubernetes.io/docs/concepts/workloads/pods/pod/
