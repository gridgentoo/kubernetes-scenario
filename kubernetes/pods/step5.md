# Multi-Container Pods (Sidecar Pattern)

So far, we have been working with a Pod managing a single container. However, some container patterns (sidecar, adapter and ambassador) require more than one running container inside a single Pod.

NOTE: the **sidecar** container pattern is a very common practice for logging utilities, sync services, watchers, and monitoring agents.

## Launch a Multi-Container Pod

Generally you will want to launch pods into your K8S cluster from a file, since infrastructure as code promotes transparency and reproducibily.

Examine the `./resources/multi-container.yaml` file in the resource browser.

This file specifies a simple Alpine Linux container and an NGiNX container. Start a pod by deploying a new NGiNX container using the **create** command.

`kubectl create -f ./resources/multi-container.yaml`{{execute}}

Verify that the new `pod-with-sidecar` pod is running:

`kubectl get pods`{{execute}}

It may take a few seconds for the pod `STATUS` to change from **ContainerCreating** to **Running**.

You should see output similar to this:

```
NAME               READY     STATUS    RESTARTS   AGE
pod-with-sidecar   2/2       Running   0          15s
```

Now, let's get a little more information:

`kubectl describe pod pod-with-sidecar`{{execute}}

## Label the Pod

One or more labels can be applied to a pod. Labels are used to help group different Kubernetes objects together. Apply a label to the sidecar pod:

`kubectl label pods pod-with-sidecar mycoollabel=awesome`{{execute}}

To show labels on a pod, use the following command:

`kubectl get pods --show-labels`{{execute}}

## List all containers running in a pod

To show the container names associated with the pod labelled "mycoollabel=awesome":

`kubectl get pods -l mycoollabel=awesome -o jsonpath={.items[*].spec.containers[*].name}`{{execute}}

You should see the following container names:

* app-container
* sidecar-container

## Delete the Pod

Now that we're done, let's delete our pod:

`kubectl delete -f ./resources/multi-container.yaml`{{execute}}