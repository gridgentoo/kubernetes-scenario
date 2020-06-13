Provisioning a Shiny demonstration is easily done by invoking this command. Declare the Deployment and Service exposing the endpoint 31111.

First, declare the Deployment

`kubectl create -f shiny-demo.yaml`{{execute}}

The Shiny server takes about a minute to start. Watch the Deployment _AVAILABLE_ state change from _0_ to _1_. To get a complete status of the deployment availability run this inspection.

`watch kubectl get deployments,pods,services`{{execute}}

After a few minutes, the Pod will move to the _running_ state and the Deployments will move to the _available (1)_ state. Once complete use this ```clear```{{execute interrupt}} to break out of the watch or press <kbd>Ctrl</kbd>+<kbd>C</kbd>.

In Katacoda, you can access the application in your browser from the "Shiny Demo" tab above the command-line area or this link: https://[[HOST_SUBDOMAIN]]-31111-[[KATACODA_HOST]].environments.katacoda.com/
