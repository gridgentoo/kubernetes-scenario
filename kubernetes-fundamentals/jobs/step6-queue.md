Jobs are an effective mechanism to accept work from a queue and publish the results downstream when completed. Multiple Jobs can run asynchronously and in parallel to accept enqueued items and deque the items when completed. 

This example starts up a simple queuing service, enqueues keygen request work items, then parallel jobs process the work items by submitting they keygen results back to the queue.

## Start Queuing Service ##

Start the work queue.

`kubectl apply -f https://raw.githubusercontent.com/kubernetes-up-and-running/examples/master/10-4-rs-queue.yaml`{{execute}}

## Submit Items to Queue ##

Produce a collection of work items and place onto a queue. First, use port forwarding locally as the shell script expects the queue service to be available on port 8080.

`QUEUE_POD=$(kubectl get pods -l app=work-queue,component=queue -o jsonpath='{.items[0].metadata.name}')`{{execute}}

`kubectl port-forward $QUEUE_POD 8080:8080 &`{{execute}}

`curl https://raw.githubusercontent.com/kubernetes-up-and-running/examples/master/10-6-load-queue.sh | bash`{{execute}}

View the _enqueued_ items count, it will be 100.

`curl localhost:8080/memq/server/stats`{{execute}}

You can also see the queue in the portal. Because of Katacoda's virtualization, you cannot address this URL from your browser, but you can use Katacoda's domain as the URL to the same service.

These commands will expose the service externally to Katacoda's subdomain scheme.

Expose the queue with a Kubernetes service to allow access to the Queue Portal.

`kubectl apply -f https://raw.githubusercontent.com/kubernetes-up-and-running/examples/master/10-5-service-queue.yaml`{{execute T1}}

`kubectl patch service queue --type='json' --patch='[{"op": "replace", "path": "/spec/type","value":"NodePort"}]'`{{execute}}

`kubectl patch service queue --type='json' --patch='[{"op": "replace", "path":"/spec/ports/0/nodePort", "value":31001}]'`{{execute}}

Notice the same port number is placed in the subdomain of the URL.

`https://[[HOST_SUBDOMAIN]]-31001-[[KATACODA_HOST]].environments.katacoda.com/`

## Process Work Items ##

Inspect the new Jobs that will consume and work on these enqueued items. Notice the resource is defined with 5 jobs to run in parallel. Once all the queued items have been processed the jobs will complete.

`curl https://raw.githubusercontent.com/kubernetes-up-and-running/examples/master/10-7-job-consumers.yaml`{{execute}}

Create a parallel consumer Job.

`kubectl apply -f https://raw.githubusercontent.com/kubernetes-up-and-running/examples/master/10-7-job-consumers.yaml`{{execute}}

Watch the Pod activity, queue, and Kubernetes dashboard.

`kubectl get pods`{{execute}}

Go back to the Queue portal watch the items get processed until all 100 are complete. You can also watch the progress with this _curl_.

`watch -n 3 curl -s https://[[HOST_SUBDOMAIN]]-31001-[[KATACODA_HOST]].environments.katacoda.com/memq/server/stats`{{execute}}

## Clean Up ##

`kubectl delete rs,svc,job --selector chapter=jobs`{{execute interrupt}}
