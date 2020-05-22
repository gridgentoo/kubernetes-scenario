A common Helm _chart_ is predefined for installing Nuclio. Many popular and stable charts appear in the [curated Helm chart repository](https://github.com/kubernetes/charts/stable). Other charts, such as the Nuclio chart, will be in other repos. Use this `repo add` command will allow Helm to find the Nuclio chart:

`helm repo add nuclio https://nuclio.github.io/nuclio/charts`{{execute}}

Create a namespace for the installation target.

`kubectl create namespace nuclio`{{execute}}

Install the Nuclio controller

`helm install nuclio nuclio/nuclio --namespace=nuclio --set dashboard.nodePort=31000`{{execute}}

Watch Nuclio starting and verify it's _Available_.

`kubectl --namespace=nuclio get deployments,pods,services,crds`{{execute}}
