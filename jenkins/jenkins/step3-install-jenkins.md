## Persistent Volume ##

Jenkins will be making a PersistentVolumeClaim so a PersistentVolume will be needed. Since this is all temporary in Katacoda, a [hostPath based PersistentVolume](https://kubernetes.io/docs/tasks/configure-pod-container/configure-persistent-volume-storage/#create-a-persistentvolume) is created 

`mkdir /mnt/data && kubectl create -f pv-host-path.yaml`{{execute}}

## Install Jenkins ##

Let's install Jenkins on Kubernetes.

A growing list of public stable charts are available and can be seen with this listing command

`helm search stable`{{execute}}

We are interested in the stable/jenkins chart listed here

`helm search stable/jenkins`{{execute}}

Create a namespace for the installation target.

`kubectl create namespace jenkins`{{execute}}

Add the chart repository for the Helm chart to be installed.

`helm repo add stable https://kubernetes-charts.storage.googleapis.com`{{execute}}

To start Jenkins use Helm to install the stable/Jenkins chart.

`helm install stable/jenkins jenkins --namespace jenkins -f jenkins-values.yaml`{{execute}}

The jenkins-values.yaml file includes details for the Jenkins configuration to ensure it starts with all the appropriate plugins, along with its Kubernetes plugin. The Jenkins chart also installs a definition for a custom container for running Jenkins jobs. The jenkins-slave-docker:kubectl Docker container image contains the KubeCtl CLI application that the Jenkinsfile in hello-world-instrumented will call. The Jenkinsfile handles the compiling, Docker image building, deploying and canary deployment logic.

Next, give the plugin and access to Quay credentials. Later, when a pipeline runs, it will access Quay through the credentials. The credentials are supplied as a secret and the Jenkinsfile code access the secret credentials using Kubectl commands. The Jenkins agent running the Jenkinsfile job has access to Docker and Kubectl. To register the Quay credentials add this secret:

`kubectl -n jenkins create -f quay-secret.yaml`{{execute}}

Verify Jenkins is starting with this Kubernetes introspection command:

`kubectl get deployments,pods -n jenkins`{{execute}}

Run this command until the deployment changes the *Available* status from 0 to 1. This will take a few moments.

There will now be a Jenkins service running that you can access through a Kubernetes NodePort. List the available services with this:

`kubectl get services -n jenkins`{{execute}}

Look for the Jenkins service in the namespace `jenkins`. The Jenkins portal can not be accessed by clicking on the `Jenkins Portal` tab located above the terminal window on the right or by clicking this link:

https://[[HOST_SUBDOMAIN]]-31111-[[KATACODA_HOST]].environments.katacoda.com/

In the jenkins-values.yaml file is a list of defined plugins. Through the Jenkins dashboard observe those plugins are present.

## Verify Jenkins with Kubernetes ##

Here is an example test pipeline script that inspects environment variables and uses KubeCtl commands to manipulate Kubernetes. Create a pipeline in Jenkins, paste this script and build the pipeline.

```text
node {
  stage ('Inspections') {
    sh('env > env.txt')
    sh('cat env.txt')

    sh('kubectl get secret quay -o yaml -n jenkins')

    def quayUserName = sh(script:"kubectl get secret quay -n jenkins -o=jsonpath='{.data.username}' | base64 -d", returnStdout: true)
    def quayPassword = sh(script:"kubectl get secret quay -n jenkins -o=jsonpath='{.data.password}' | base64 -d", returnStdout: true)

    echo "Quay access: ${quayUserName} / ${quayPassword}"
  }
}
```{{copy}}
Click ^ on the above copy icon to copy this pipeline text to your clipboard, then paste into the configuration for the new pipeline.

This pipeline will take a few minutes to startup and run. Through the Kubernetes dashboard observe how a new pod is created in the jenkins namespace by the Jenkins Kubernetes plugin. To verify this pipeline success, inspect the build's console output and verify at the end the "Quay access:" line reports the Quay secret credentials.
