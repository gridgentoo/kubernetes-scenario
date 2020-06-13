Now, this starts to get really interesting. So far you have Kubernetes running with Prometheus monitoring and Jenkins.

> To demonstrate, a simple web application is used. Its GitHub repo has two branches: production and canary. Using a Jenkins Pipeline, when changes are committed to the canary branch a build will be triggered and the new version will be rolled out to all replicas in the canary deployment. Once the change is validated, usually via some automated testing and health checks, changes are pushed to the production branch that will trigger the Jenkins Pipeline to update all deployments in the production deployment.

Next, add a new pipeline based on a Jenkinsfile that can orchestrate the building and deployment.

## Create a Jenkins Pipeline

Navigate to the Jenkins portal page:

https://[[HOST_SUBDOMAIN]]-31111-[[KATACODA_HOST]].environments.katacoda.com/

From Jenkins main page:

1. Select "New Item"
1. Enter name "Canary Example"
1. Select "Pipeline", click OK
1. In Pipeline section below select "Pipeline script from SCM"
1. From SCM dropdown select Git
1. For the Git repository copy and paste this URL:

`https://github.com/sylus/hello-world-instrumented`{{copy}}

## Initial Pipeline Run

1. Click 'Build Now'
1. View build console output and notice the job is waiting for container agent
1. Agent appears in Jenkins main
1. Go to the Kubernetes dashboard and observe the Jenkins agent container spinning up

## Verify Hello-world

Once the Jenkins pipeline completes successfully, a very simple Python application is deployed. The service is instrumented to serve metrics using the [Prometheus instrumentation library for Python](https://github.com/prometheus/client_python).

The application is served on port 5000, via an exposed NodePort:

`SERVICE=http://localhost:$(kubectl get svc hello-world -n monitoring-demo -o jsonpath="{.spec.ports[?(@.name=='web')].nodePort}")`{{execute}}

`while true; sleep .3; do curl -s $SERVICE; done`{{execute}}

and the metrics are served on 8000, via an exposed NodePort 1:

`METRICS=http://localhost:$(kubectl get svc hello-world -n monitoring-demo -o jsonpath="{.spec.ports[?(@.name=='metrics')].nodePort}")`{{execute}}

`curl $METRICS`{{execute}}

Exercise the service at port 5000 a few times with curl or from a browser to generate some metrics.

`while true; sleep .3; do curl $SERVICE; done;`{{execute}}

This command will point your default browser to the observable metrics:

`start http://localhost:$(kubectl get svc hello-world -n monitoring-demo -o jsonpath='{.spec.ports[1].node Port}{"\n"}')`{{execute}}

The hello-world application is in the monitoring-demo namespace. Each service has two NodePorts exposed, one for the service response and one for the metrics response. This is the metrics URL that Prometheus is currently scraping.

`kubectl get pods,services -n monitoring-demo`{{execute}}

Notice that behind the service are 3 instances of the service running, 2 production and 1 canary.
