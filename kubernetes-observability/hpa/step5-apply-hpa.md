Simple autoscaling declarations can be applied directly with the Kubectl.

`kubectl autoscale deployments/php-apache --cpu-percent=40 --min=1 --max=10`

However, we will declare the HPA rules with a YAML baed manifest.

`cat hpa.yaml`{{execute T1}}

Apply these HPA rules.

`kubectl create -f hpa.yaml`{{execute T1}}

A new HPA is now registered. Inspect the HPA list.

`kubectl get hpa`{{execute T1}}

Inspect the state of the HPA with the describe command.

`kubectl describe hpa php-apache`{{execute T1}}

With the HPA enabled notice more Pods are started. It will be take about a minute before you start seeing the Pods scale up.

`watch "kubectl get pods && echo "" && kubectl top pods && echo "" && kubectl get hpa"`{{execute T1}}

Once complete use this ```clear```{{execute interrupt T1}} to break out of the watch or press <kbd>Ctrl</kbd>+<kbd>C</kbd>.
