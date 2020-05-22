Create a namespace for the Chaoskube service.

`kubectl create namespace chaoskube`{{execute}}

Install Chaoskube using the Helm chart.

```
helm install chaoskube stable/chaoskube -n chaoskube \
  --set dryRun=false \
  --set namespaces=!kube-system \
  --set labels=app-purpose=chaos \
  --set interval=20s
```{{execute}}

The parameters instruct Chaoskube to kill Pods every 20 seconds. The targeted Pods are any with the label app-purpose=chaos, and the kube-system namespace has be explicitly excluded (!) from the list of namespaces to look for Pods to kill. There are a few other parameters covered in the [Helm chart documentation](https://github.com/helm/charts/tree/master/stable/chaoskube#configuration).

You can periodically check the Chaoskube log to see its Pod killing activity.

`POD=$(kubectl -n chaoskube get pods -l='app.kubernetes.io/instance=chaoskube' --output=jsonpath='{.items[0].metadata.name}')`{{execute}}

`kubectl -n chaoskube logs -f $POD`{{execute}}

When you are done watching the log use this ```clear```{{execute interrupt}} to break out of the watch (-f) or press <kbd>Ctrl</kbd>+<kbd>C</kbd>.
