Deploy the _figlet_ function.

`faas-cli store deploy figlet --label "com.openfaas.scale.zero=true"`{{execute}}

Notice the label passed in ensures the functions deployed, but the Pod is not running. A key feature of functions is when idle, consume no resources, and upon activity scale-up hot instances. When activity quiets the Pods are released. OpenFaaS manages these scaling details for you, based on load metrics metered to Prometheus.

Exercise the _figlet_ function.

`curl -X POST https://[[HOST_SUBDOMAIN]]-31112-[[KATACODA_HOST]].environments.katacoda.com/function/figlet -d 'No Fluff Just Stuff is transcendent'`{{execute}}

Put some load on the function by repeating the request in a loop.

`while [ true ]; do curl -sw 'Total: %{time_total}s\n' https://[[HOST_SUBDOMAIN]]-31112-[[KATACODA_HOST]].environments.katacoda.com/function/figlet -d 'NFJS'; done;`{{execute}}

Navigate to the Grafana dashboard and notice the rising Replica scaling value. OpenFaaS is not scaling up new function instances to handle the increased load. Go to the OpenFaaS portal and notice the rising of the replicas with all the invocation counts. Go to the Kubernetes dashboard and in the openfaas-fn namespaces notice all the pods that are scaled up to handle the load.

Use this ```clear```{{execute interrupt}} to break out of the watch or press <kbd>Ctrl</kbd>+<kbd>C</kbd>.

Now that the activity has stopped, quickly start this watch.

`watch kubectl get pods -n openfaas-fn`{{execute}}

Notice the figlet Pods are scaling down (Terminating) as the activity calms down. The Pods will scale to one and after another 10 seconds (this was a Helm chart parameter) of no activity, the single hot Pod will be removed to a resting scale of zero. When all is quiet, the functions still accept activity, yet no resources are consumed.

This exercise is adopted from [lab 9 found here](https://github.com/openfaas/workshop/blob/master/lab9.md).

Alex Ellis demonstrates scaling [in this video](https://youtu.be/H9cx3w5CW3o).
