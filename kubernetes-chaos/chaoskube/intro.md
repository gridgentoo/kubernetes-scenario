# Chaoskube on Kubernetes #

<img align="right" alt="Chaoskube" title="Chaoskube" src="./assets/chaoskube.png" width=300>

> Adopting chaos engineering strategies for your production environment is useful, because it is the only way to test if a system supports unexpected destructive events.

**Chaoskube** periodically kills random Pods in your Kubernetes cluster which allows you to test how your system behaves under arbitrary Pod failures. Chaoskube is a tool designed by Martin Linkhorst and its [open source is found here](https://github.com/linki/chaoskube).

You will learn how:

- to install Chaoskube onto Kubernetes
- to adjust the Helm chart configuration to quickly see it in action
- to install and label applications to make them eligible targets for chaos
