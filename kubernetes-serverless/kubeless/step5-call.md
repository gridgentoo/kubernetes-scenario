## Call from CLI ##

Use the Kubeless CLI tool to call the function.

`kubeless function call fibonacci --data '{"length":"10"}'`{{execute}}

## Call from URL ##

Run a Kubernetes proxy to expose the cluster at a port.

`kubectl proxy --port 8080`{{execute T2}}

Call the function via curl.

`curl --data '{"length":"20"}' localhost:8080/api/v1/namespaces/default/services/fibonacci:8080/proxy/ --header "Content-Type:application/json" && echo`{{execute T1}}
