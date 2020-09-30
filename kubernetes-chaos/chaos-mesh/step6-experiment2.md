In this next experiment explore how Chaos Mesh carries out the common experiment of periodic and random Pod removal.

## Install Example Nginx application

Install an example application as a target for the experiment. It's just a deployment of the common Nginx web server with Pod replications. Apply the Deployment to the _chaos-sandbox_ namespace:

`kubectl create namespace chaos-sandbox`{{execute}}

`kubectl apply -f nginx.yaml -n chaos-sandbox`{{execute}}

It will take a moment to start all the Pods. You can see the application status in the default namespace:

`kubectl get -n chaos-sandbox deployments,pods,services`{{execute}}

## Define Experiment

The Chaos Mesh has installed several custom resources:

`kubectl get crds`{{execute}}

For this experiment well create a declarative YAML manifests that defines an experiment around `podchaos.chaos-mesh.org`. The experiment specification for the _PodChaos_ manifest appears this way:

`ccat pod-removal-experiment.yaml`{{execute}}

The experiment declares that the specific pod should be killed every 15s. The removal will only be applied to the target pod labeled "chaos": "blast here", which is the _blast radius_:

`kubectl get -n chaos-sandbox deployments,pods,services -l chaos=blast-here`{{execute}}

## Apply Experiment

Because the Chaos Mesh follows the Kubernetes Operator pattern with CRDs, the experiment can be applied like any other Kubernetes object.

`kubectl apply -f pod-removal-experiment.yaml`{{execute}}

The experiment is now running.

`kubectl get PodChaos -n chaos-mesh`{{execute}}

## Observe

Based on the cron time in the experiment, watch the Pods randomly terminate and new ones start:

`watch kubectl get -n chaos-sandbox deployments,pods,services`{{execute}}

Use this `clear`{{execute interrupt}} to break out of the watch or press <kbd>Ctrl</kbd>+<kbd>C</kbd>.

Look at the Chaos Mesh dashboard, find the experiment, and drill down to explore the experiment details.

There are many more types of experiments. Which ones appeal to you that could help your application increase its availability in times of chaos?
