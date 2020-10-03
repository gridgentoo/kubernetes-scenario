
When you have an application that consists of one pod and one service, there is no problem operating these resources. But when your application grows, or you have tens or hundreds of projects, pods, services and other Kubernetes resources, it will get harder to operate and effectively troubleshoot Kubernetes. This is where we can use the Kubernetes labels we mentioned earlier in this chapter. We are going to run a couple more Kubernetes pods using labels:


`kubectl run httpd1 --image=httpd --labels="app=httpd-demo1"`{{execute}}

`kubectl run httpd2 --image=httpd --labels="app=httpd-demo2"`{{execute}}

Check the Kubernetes pods we have at the moment:
`kubectl get pods`{{execute}}

Now, imagine you have at least 10 or more pods. In order to efficiently filter out this output, we can use the -l option:
`kubectl get pods -l="app=httpd-demo2"`{{execute}}

```
NAME                   READY       STATUS      RESTARTS       AGE
httpd2-5b4ff5cf57-9llkn 1/1         Running    0              2m
```

**Note:** Filtering out output with Kubernetes labels is not the only use case. Labels are also used alongside selectors.