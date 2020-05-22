# Kube Monkey on Kubernetes #

<img align="right" alt="Credit: Photo by Jilbert Ebrahimi on Unsplash" title="Credit: Photo by Jilbert Ebrahimi on Unsplash" src="./assets/jilbert-ebrahimi-pVEcNabAg9o-unsplash.jpg" width=400>

> Adopting chaos engineering strategies for your production environment is useful, because it is the only way to test if a system supports unexpected destructive events.

**Kube Monkey** is an implementation of Netflix’s chaos monkey for Kubernetes clusters. It periodically schedules a list of pods termination events to test the fault tolerance of your highly available system.

You will learn how:

- to install Kube Monkey onto Kubernetes
- to enable Kube Monkey demo mode to quickly see it in action
- to install and label applications to make them eligible targets for chaos
