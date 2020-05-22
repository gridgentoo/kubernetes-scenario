While automatically scaling up your instances is vital to help maintain a consistent and performant service, it's equally important to shut down cloned instances when that are not being used. The less that runs hot on a Kubernetes cluster, the more money you will save. The real cost savings kicks in when you combine the HPA feature with the scaling down of Nodes with [Cluster Node Scaling](https://github.com/kubernetes/autoscaler). In this scenario, we are just looking at HPA.

## API version Note ##

The Kubernetes cluster you are running is version 1.14 and this version only supports `apiVersion: autoscaling/v1` as you can see in the HPA.yaml manifest and through this API version check.

`kubectl version --short=true && \
kubectl api-versions | grep autoscaling && \
cat hpa.yaml | grep apiVersion`{{execute T1}}

Kubernetes version 1.17 released an improved HPA controller that responds to `apiVersion:v2beta2`

The v2beta2 version of the HPA offers many more declarations to control the scaling up and scaling down behavior. For instance, for this demo, there is a window to allow the scaling down to happen much faster than the default five minutes. There is another flag on the Kubernetes cluster called `horizontal-pod-autoscaler-downscale-delay`, but that would have to be established before the cluster started which is why the newer versions of HPA allow settings such as these behaviors.

```
  behavior:
    scaleDown:
      stabilizationWindowSeconds: 60
      policies:
      - type: Percent
        value: 100
        periodSeconds: 15
    scaleUp:
      stabilizationWindowSeconds: 0
      policies:
      - type: Percent
        value: 100
        periodSeconds: 15
      - type: Pods
        value: 4
        periodSeconds: 15
      selectPolicy: Max
```
More on these newer behavior features is [here](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/#support-for-configurable-scaling-behavior).

## Scale Down ##

So, if you are willing to wait the default 5 minutes you can watch the Pods automatically scale down. Stop the load testing requests and observe how the HPA reacts by scaling down the Pod count.

Go back _Terminal 2_ from the Tab above and break out of the loop. Use this ```clear```{{execute interrupt T2}} to break out of the loop or press <kbd>Ctrl</kbd>+<kbd>C</kbd>.

Go back to _Terminal 1_ and notice all but 2 `php-apache` Pods will shutdown after the default **5 minutes** window.

`watch "kubectl get pods && echo "" && kubectl top pods && echo "" && kubectl get hpa "`{{execute T1}}

Once complete use this ```clear```{{execute interrupt T1}} to break out of the watch or press <kbd>Ctrl</kbd>+<kbd>C</kbd>.
