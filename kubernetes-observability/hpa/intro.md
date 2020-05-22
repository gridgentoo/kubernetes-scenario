<img align="right" src="./assets/sheep.png" width="400">

# Scaling Your Applications, Automatically #

Almost always there will be more than once instance of each of your applications on Kubernetes. Multiple instances provide both fault tolerance and increased traffic serving when the demand for your service increases. After all, why did you move your applications to a distributed platform like Kubernetes? Because you want to leverage the large amount of CPU, memory and I/O across your cluster. However, as you know these resources cost money so you only want your service replications to increase when the demand increases. When service demand is low the instances should scale down to save you money, and lessen your carbon footprint.

There are three types of scaling in Kubernetes:

1. [Horizontal Pod Scaling](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/)
2. [Cluster Node Scaling](https://github.com/kubernetes/autoscaler)
3. [Vertical Pod Scaling](https://github.com/kubernetes/autoscaler/tree/master/vertical-pod-autoscaler)

This scenario shows you how to achieve Horizontal Pod Scaling, automatically. While you can scale manually, you really want scaling to be automatic based on demand, so the complete name for thi Kubernetes feature is the [Horizontal Pod Autoscalar (HPA)](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/).

Basic automatic scaling is simply achieved by declaring the CPU threshold and the minimum and maximum number of Pods to scale up and the minimum Pod count down. Exceeding the CPU threshold is monitored by observing the current CPU load metric and triggering scaling events when activity goes up or down within as specified time period. It's essentially a control loop comparing metrics against declared states.

In the following steps you will learn how to:

- install the metrics-server for gathering metrics,
- install a Pod that can be scaled,
- define the scaling rules and the number of pods to scale up and down,
- increase service demand to trigger scaling up,
- observe scaling up and down.
