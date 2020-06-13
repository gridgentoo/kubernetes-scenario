For a canary deployment monitoring the performance and behavior of newly deployed containers is important to inspect before deciding to either promote the new version, or rolling it back. Containers can be monitored with Prometheus. There is a stable Helm chart that installs a Prometheus operator and some opinionated configurations on top of that.

To install and configure the Prometheus stack run the following:

`./resources/prometheus-stack.sh`{{execute}}

The above script includes a wait command, so it will take a few minutes for it to complete.

Below are instructions that configure Prometheus to watch for the performance of the hello-world deployment:

`kubectl create -n monitoring -f ./resources/monitoring.yaml`{{execute}}

Lets now setup a Jenkins pipeline to build, deploy and install the hello-world application in our Kubernetes cluster.
