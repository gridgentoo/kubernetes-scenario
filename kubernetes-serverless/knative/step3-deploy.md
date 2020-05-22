To deploy an application on Knative the same kubectl CLI tool can be used just like any other Kubernetes based application. The difference is in the YAML declaration using a resource called _service_. This is not to be confused with the core Kubernetes service resource, instead this is a resource for Knative. It's declaration look like this, 

`curl https://raw.githubusercontent.com/knative/docs/master/docs/serving/samples/hello-world/helloworld-go/service.yaml`{{execute}}

Notice the kind _Service_ and the apiVersion that defines its context. Using this services resource and YAML, deploy an example Hello World application written in Go. The code and app container has already been published to a registry.

`kubectl create -f https://raw.githubusercontent.com/knative/docs/master/docs/serving/samples/hello-world/helloworld-go/service.yaml`{{execute}}

Confirm the service has been deployed.

`kubectl get deployments,rs,pods,services`{{execute}}

**DRAFT NOTE: The service is expected to start, but fails with a RevisionMissing and a http status 404 result. This is work in progress. If you see the solution email jonathan.johnson@dijure.com.**

The service is there, and it can be seen with these commands.

`kubectl get ksvc helloworld-go`{{execute}}

`kubectl get routes`{{execute}}
