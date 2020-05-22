## Verify Application is Healthy

View the Pods and its exposed Service.

`kubectl get deployments,pods,services`{{execute}}

You can also check the dashboard and soon the app will appear as three pods in the default namespace.

## Access Application

<img align="right" src="./assets/ribbon.png" width="150">

View the [Node.js application](https://[[HOST_SUBDOMAIN]]-32000-[[KATACODA_HOST]].environments.katacoda.com/).

**&#x2714; You did it!** A Tekton CI/CD pipeline based on Kubernetes has built, deployed, and served your application.
