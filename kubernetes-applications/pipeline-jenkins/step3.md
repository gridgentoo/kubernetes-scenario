## Persistent Volume

Jenkins will be making a PersistentVolumeClaim so a PersistentVolume will be needed. Since this is all temporary in Katacoda, a [hostPath based PersistentVolume](https://kubernetes.io/docs/tasks/configure-pod-container/configure-persistent-volume-storage/#create-a-persistentvolume) is created

`mkdir /mnt/data && kubectl create -f ./resources/pv-host-path.yaml`{{execute}}

## Install Jenkins

Let's install Jenkins on Kubernetes.

A growing list of public stable charts are available and can be seen with this listing command

`helm search stable`{{execute}}

We are interested in the stable/jenkins chart listed here

`helm search stable/jenkins`{{execute}}

To start Jenkins use Helm to install the stable/Jenkins chart.

`helm install stable/jenkins --namespace jenkins --name jenkins -f ./resources/values-override.yaml`{{execute}}

The `values-override.yaml` file includes details for the Jenkins configuration to ensure it starts with all the appropriate plugins, along with its Kubernetes plugin. The Jenkins chart also installs a definition for a custom container for running Jenkins jobs. The jenkins-slave-docker:kubectl Docker container image contains the KubeCtl CLI application that the Jenkinsfile in hello-world-instrumented will call. The Jenkinsfile handles the compiling, Docker image building, deploying and canary deployment logic.

Next, give the plugin and access to Quay credentials. Later, when a pipeline runs, it will access Quay through the credentials. The credentials are supplied as a secret and the Jenkinsfile code access the secret credentials using Kubectl commands. The Jenkins agent running the Jenkinsfile job has access to Docker and Kubectl. To register the Quay credentials add this secret:

`kubectl -n jenkins create -f ./resources/quay-secret.yaml`{{execute}}

Verify Jenkins is starting with this Kubernetes introspection command:

`kubectl get deployments,pods -n jenkins`{{execute}}

Run this command until the deployment changes the *Available* status from 0 to 1. This will take a few minutes.

There will now be a Jenkins service running that you can access through a Kubernetes NodePort. List the available services with this:

`kubectl get services -n jenkins`{{execute}}

Look for the Jenkins service in the namespace `jenkins`. The Jenkins portal can not be accessed by clicking on the `Jenkins Portal` tab located above the terminal window on the right or by clicking this link:

https://[[HOST_SUBDOMAIN]]-31111-[[KATACODA_HOST]].environments.katacoda.com/

In the `values-override.yaml` file is a list of defined plugins. Through the Jenkins dashboard observe those plugins are present.
