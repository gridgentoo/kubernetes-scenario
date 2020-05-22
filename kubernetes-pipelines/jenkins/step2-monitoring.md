For a canary deployment monitoring the performance and behavior of newly deployed containers is important to inspect before deciding to either promote the new version, or rolling it back. Containers can be monitored with Prometheus. There is a stable Helm chart that installs a Prometheus operator and some opinionated configurations on top of that. To install and configure the Prometheus stack run these 3 commands:

`curl https://raw.githubusercontent.com/javajon/kubernetes-observability/master/configurations/prometheus-stack.sh | bash -s`{{execute}}

The above script includes a wait command, so it will take a few minutes for it to complete.

Roadmap: Need to add ServiceMonitor for scraping the hello-world metrics. For now metrics can be largely seen at the node CPU and memory metrics. Consider these two declarations ():

`kubectl create -n monitoring -f monitoring.yaml`{{execute}}

TODO: missing yaml
`kubectl create -n monitoring -f alertmanager-latency-rule.yaml`{{execute}}

Below are instructions that configure Prometheus to watch for performance of the upcoming hello-world deployments. But first, let's get a Jenkins pipeline to build, deploy and install the hello-world application.
